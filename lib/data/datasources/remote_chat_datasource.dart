import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:offline_first_chat_bloc_mvvm/data/models/messege_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RemoteChatDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Send message to Firestore
  Future<void> sendMessage(String chatId, MessageModel message) async {
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(message.id)
        .set(message.toMap());
  }

  /// Listen to messages in real-time
  Stream<List<MessageModel>> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map(
            (doc) => MessageModel.fromMap(
              doc.data(),
            ),
          )
          .toList();
    });
  }
}
