import 'package:hive_flutter/hive_flutter.dart';
import 'package:return_success_4_app/model/messageModel.dart';

class DatabaseService {
  final messagesBox = Hive.box<Message>('messages');

  /// Add the entry to the 'messages' box of Hive.
  /// Note: the box must be previously open for the operation to succeed.
  Future<void> addToMessagesBox(Message entry) async {
    // Storing the message in the Hive DB
    int newKey = await messagesBox.add(entry);
    print(
        "Adding message to messages box at key: ${newKey} with title: ${entry.title}");
  }

  /// Clear the 'messages' box of Hive.
  /// Note: the box must be previously open for the operation to succeed.
  Future<void> clearMessagesBox() async {
    // Storing the message in the Hive DB
    int newKey = await messagesBox.clear();
    print("Clearing the 'messages' box...");
  }
}
