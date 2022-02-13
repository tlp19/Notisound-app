import 'package:flutter/material.dart';
import '../../model/messageModel.dart';
import 'homepage_widgets.dart';

class MessagesHistoryListView extends StatelessWidget {
  const MessagesHistoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: ((context, index) {
          return messageCard(
            message: Message(
                title: "Someone's at the door!",
                category: "Doorbell",
                content:
                    "The doorbell just rang! You should go check who's at the door. The doorbell just rang! You should go check who's at the door.",
                dateTime: DateTime.now()),
            icon: Icons.doorbell_outlined,
            context: context,
          );
        }));
  }
}
