import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../model/messageModel.dart';

class MessagesHistoryListView extends StatelessWidget {
  const MessagesHistoryListView({Key? key}) : super(key: key);

  Widget messageCard(
      {required Message message,
      required IconData icon,
      required BuildContext context}) {
    return Container(
      //height: 90,
      //width: MediaQuery.of(context).size.width - 32,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(25, 0, 0, 0),
            offset: Offset(2, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(children: [
        // Icon
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            icon,
            size: 60,
            color: Colors.black,
          ),
        ),
        // Message
        Expanded(
          child: Container(
            height: 100,
            padding: const EdgeInsets.fromLTRB(0, 15, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      message.category + "  •  " + message.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(timeago.format(message.dateTime, locale: 'en_short')),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  message.content,
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: ((context, index) {
          return messageCard(
            message: Message(
                title: "Someone's at the door!",
                category: "Doorbell",
                content:
                    "Your doorbell just rang! You should go check who's at the door :)",
                dateTime: DateTime.now()),
            icon: Icons.doorbell_outlined,
            context: context,
          );
        }));
  }
}
