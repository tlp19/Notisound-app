import 'package:isar/isar.dart';

part 'messageModel.g.dart';

@Collection()
class Message {
  @Id()
  int id = Isar.autoIncrement;

  String title;

  String category;

  String content;

  DateTime dateTime;

  String author;

  Message({
    required this.title,
    required this.category,
    required this.content,
    required this.dateTime,
    required this.author,
  });

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'category': category,
      'content': content,
      'dateTime': dateTime.toString(),
      'author': author,
    };
  }

  factory Message.fromJson(Map<String, dynamic> data) {
    return Message(
      title: data['title'] ?? 'Unknown title',
      category: data['category'] ?? 'Unknown category',
      content: data['content'] ?? 'No content',
      dateTime: DateTime.now(),
      author: data['author'] ?? 'No author',
    );
  }
}
