import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../model/messageModel.dart';

/// Colourful circular button with an icon
Widget iconButton(
    {required IconData icon,
    required Color color,
    required Function onPressed}) {
  return Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
    child: IconButton(
        onPressed: () {
          onPressed();
        },
        icon: Icon(
          icon,
          size: 40,
          color: Colors.white,
        )),
  );
}

/// A card that displays a message of type Message
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
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(timeago.format(message.dateTime, locale: 'en_short')),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Expanded(
                child: Text(
                  message.content,
                  style: const TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    ]),
  );
}
