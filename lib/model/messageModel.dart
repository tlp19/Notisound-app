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

  Message({
    required this.title,
    required this.category,
    required this.content,
    required this.dateTime,
  });

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'category': category,
      'content': content,
      'dateTime': dateTime.toString()
    };
  }

  factory Message.fromJson(Map<String, dynamic> data) {
    return Message(
      title: data['title'] ?? 'Unknown title',
      category: data['category'] ?? 'Unknown category',
      content: data['content'] ?? 'No content',
      dateTime: DateTime.now(),
    );
  }
}
