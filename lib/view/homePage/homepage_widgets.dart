import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../model/message_model.dart';
import '../general_widgets.dart';

Widget header(BuildContext context) {
  return SizedBox(
    height: (MediaQuery.of(context).size.height / 4),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Notisound',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconButton(
                icon: Icons.refresh_rounded,
                color: const Color.fromARGB(255, 126, 206, 195),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/');
                },
              ),
              const SizedBox(width: 24),
              iconButton(
                  icon: Icons.bar_chart_rounded,
                  color: const Color.fromARGB(255, 43, 133, 118),
                  onPressed: () async {
                    Navigator.pushNamed(
                      context,
                      '/analytics',
                    );
                  }),
              const SizedBox(width: 24),
              iconButton(
                  icon: Icons.settings_rounded,
                  color: const Color.fromARGB(255, 165, 174, 185),
                  onPressed: () async {
                    Navigator.pushNamed(
                      context,
                      '/settings',
                    );
                  }),
            ],
          ),
        ],
      ),
    ),
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
          blurRadius: 8,
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
          color: const Color.fromARGB(255, 48, 48, 48),
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
                  Expanded(
                    child: Text(
                      message.category + "  •  " + message.title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
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
