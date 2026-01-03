import 'dart:math';

import 'package:offline_first_chat_bloc_mvvm/data/models/messege_model.dart';

import '../../core/local/hive_service.dart';
import '../../core/connectivity/connectivity_service.dart';
import '../datasources/remote_chat_datasource.dart';
import '../../domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final RemoteChatDataSource remote;
  final ConnectivityService connectivity;

  ChatRepositoryImpl(this.remote, this.connectivity);

  @override
  Future<void> sendMessage(String sender, String receiver, String text) async {
    final online = await connectivity.isOnline();
    final id = Random().nextInt(999999).toString();

    final message = MessageModel(
      id: id,
      senderId: sender,
      receiverId: receiver,
      text: text,
      timestamp: DateTime.now(),
      isPending: !online,
    );

    // 1️⃣ Always save locally
    await HiveService.saveMessage(message);

    // 2️⃣ Send to Firebase only if online
    if (online) {
      final chatId = sender.compareTo(receiver) < 0
          ? '${sender}_$receiver'
          : '${receiver}_$sender';

      await remote.sendMessage(chatId, message);
    }
  }

  @override
  Future<void> syncPendingMessages() async {
    final pending = HiveService.getPendingMessages();

    for (var msg in pending) {
      final chatId = msg.senderId.compareTo(msg.receiverId) < 0
          ? '${msg.senderId}_${msg.receiverId}'
          : '${msg.receiverId}_${msg.senderId}';

      await remote.sendMessage(chatId, msg);
    }
  }

  @override
  Stream<List<MessageModel>> listenToMessages(String chatId) {
    return remote.getMessages(chatId);
  }
}
