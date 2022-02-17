import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../model/messageModel.dart';

/// Colourful circular button with an icon
Widget iconButton(
    {String? label,
    required IconData icon,
    required Color color,
    required Function onPressed}) {
  return GestureDetector(
    onTap: () {
      onPressed();
    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon
        Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            )),
        // Label (if any)
        (label == null)
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
      ],
    ),
  );
}

/// A customizable pop-up alert dialog
Widget buildPopupDialog(
    {required BuildContext context,
    required String dialogTitle,
    required List<Widget> dialogContent,
    required String buttonText,
    required Function onButtonPressed}) {
  return AlertDialog(
    title: Text(dialogTitle),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: dialogContent,
    ),
    actions: [
      TextButton(
        child: const Text("Cancel"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      TextButton(
        child: Text(buttonText),
        onPressed: () {
          onButtonPressed();
          Navigator.of(context).pop();
        },
      ),
    ],
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
    margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
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
        padding: const EdgeInsets.all(10.0),
        child: Icon(
          icon,
          size: 40,
          color: Color.fromARGB(255, 199, 96, 28),
        ),
      ),
      // Message
      Expanded(
        child: Container(
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
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    timeago.format(message.dateTime, locale: 'en_short'),
                    style:
                        (timeago.format(message.dateTime, locale: 'en_short') ==
                                "now")
                            ? const TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              )
                            : const TextStyle(
                                fontSize: 12,
                              ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                message.content,
                overflow: TextOverflow.ellipsis,
                maxLines: 8,
              ),
            ],
          ),
        ),
      ),
    ]),
  );
}
