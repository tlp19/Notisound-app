import 'package:isar/isar.dart';
import 'package:return_success_4_app/model/messageModel.dart';

class MessageDatabaseService {
  /// Add the entry to the 'messages' DB in Isar
  Future<void> addToMessagesDB(Isar isar, Message entry) async {
    // Storing the message in the DB
    int newKey = await isar.writeTxn((isar) async {
      int key = await isar.messages.put(entry);
      return key;
    });
    print(
        "Adding message to messages DB at key: $newKey with title: ${entry.title}");
  }

  /// Stream all elements of the DB
  Stream<List<Message>> streamMessages(Isar isar) {
    return isar.messages.where().build().watch(initialReturn: true);
  }

  /// Get an element of the DB 'messages'
  Future<Message?> getMessageById(Isar isar, int id) async {
    // Get the message
    final message = isar.messages.get(id);
    return message;
  }

  /// Clear the 'messages' DB of Isar.
  Future<void> clearMessagesDB(Isar isar) async {
    //Clear all messages
    await isar.writeTxn((isar) async {
      await isar.messages.clear();
    });
    print("Clearing the messages DB...");
  }
}
