import 'package:hive/hive.dart';

part 'messageModel.g.dart';

@HiveType(typeId: 0)
class Message {
  @HiveField(0)
  String title;

  @HiveField(1)
  String category;

  @HiveField(2)
  String content;

  @HiveField(3)
  DateTime dateTime;

  @HiveField(4)
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
