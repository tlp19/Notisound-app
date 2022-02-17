import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isar/isar.dart';

import '../../controller/databaseService.dart';
import '../../model/messageModel.dart';
import 'homepage_widgets.dart';

class MessagesHistoryListView extends StatelessWidget {
  MessagesHistoryListView({required this.isar, Key? key}) : super(key: key);

  final Isar isar;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DatabaseService().streamMessages(isar),
      builder: (context, AsyncSnapshot<List<Message>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const Center(
                child: Text(
              "No messages yet.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ));
          } else {
            return ListView.builder(
              reverse: true,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return messageCard(
                  message: snapshot.data![index],
                  icon: Icons.doorbell_outlined,
                  context: context,
                );
              },
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
