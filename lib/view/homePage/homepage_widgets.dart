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
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
            child: Icon(
              icon,
              size: 40,
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
                    fontSize: 24,
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
                  Text(
                    timeago.format(message.dateTime, locale: 'en_short'),
                    style:
                        (timeago.format(message.dateTime, locale: 'en_short') ==
                                "now")
                            ? const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold)
                            : null,
                  ),
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
