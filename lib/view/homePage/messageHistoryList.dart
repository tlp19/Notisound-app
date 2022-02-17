import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            return Column(children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height / 5),
              ),
              const Text(
                "No messages yet.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ]);
          } else {
            return ListView.builder(
              reverse: true,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return messageCard(
                  message: snapshot.data![index],
                  //icon: Icons.warning_amber_rounded,
                  icon: CupertinoIcons.antenna_radiowaves_left_right,
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
