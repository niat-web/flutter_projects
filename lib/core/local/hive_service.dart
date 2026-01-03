import 'package:hive_flutter/hive_flutter.dart';
import 'package:offline_first_chat_bloc_mvvm/data/models/messege_model.dart';

class HiveService {
  static const boxName = 'messages';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(boxName);
  }

  static Future<void> saveMessage(MessageModel message) async {
    final box = Hive.box(boxName);
    await box.put(message.id, message.toMap());
  }

  static List<MessageModel> getMessages() {
    final box = Hive.box(boxName);
    return box.values
        .map((e) => MessageModel.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  static List<MessageModel> getPendingMessages() {
    return getMessages().where((m) => m.isPending).toList();
  }
}
