class Message {
  String title;
  String category;
  String content;
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

  Message messagefromJson(Map<String, dynamic> data) {
    return Message(
      title: data['title'] ?? 'Unknown title',
      category: data['category'] ?? 'Unknown category',
      content: data['content'] ?? 'No content',
      dateTime: DateTime.parse(data['dateTime'] ?? "19700101 12:34:56"),
    );
  }
}
