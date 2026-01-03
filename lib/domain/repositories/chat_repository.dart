import 'package:offline_first_chat_bloc_mvvm/data/models/messege_model.dart';


abstract class ChatRepository {
  Future<void> sendMessage(
    String sender,
    String receiver,
    String text,
  );

  Future<void> syncPendingMessages();

  // 🔥 ADD THIS
  Stream<List<MessageModel>> listenToMessages(String chatId);
}
