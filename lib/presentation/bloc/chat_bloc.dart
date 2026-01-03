import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_first_chat_bloc_mvvm/data/models/messege_model.dart';

import 'chat_event.dart';
import 'chat_state.dart';
import '../../domain/repositories/chat_repository.dart';
import '../../core/local/hive_service.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository repo;
  final String sender;
  final String receiver;

  StreamSubscription<List<MessageModel>>? _subscription;

  ChatBloc(this.repo, this.sender, this.receiver) : super(ChatInitial()) {
    /// Send message
    on<SendMessage>((event, emit) async {
      await repo.sendMessage(sender, receiver, event.text);
      emit(ChatLoaded(HiveService.getMessages()));
    });

    /// Sync pending messages
    on<SyncPendingMessagesEvent>((event, emit) async {
      await repo.syncPendingMessages();
      emit(ChatLoaded(HiveService.getMessages()));
    });

    /// Start listening to remote messages
    on<ListenMessagesEvent>((event, emit) async {
      final chatId = sender.compareTo(receiver) < 0
          ? '${sender}_$receiver'
          : '${receiver}_$sender';

      await _subscription?.cancel();

      _subscription = repo.listenToMessages(chatId).listen(
        (messages) {
          // 🔥 convert stream callback → bloc event
          add(MessagesUpdatedEvent(messages));
        },
      );
    });

    /// Handle messages update safely
    on<MessagesUpdatedEvent>((event, emit) {
      emit(ChatLoaded(event.messages));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
