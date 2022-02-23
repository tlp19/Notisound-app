import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../../controller/messageDatabaseService.dart';
import '../../model/messageModel.dart';
import 'homepage_widgets.dart';

class MessagesHistoryListView extends StatelessWidget {
  const MessagesHistoryListView({required this.isar, Key? key})
      : super(key: key);

  final Isar isar;

  String toWord(int x) {
    if (x == 1) {
      return "January";
    } else if (x == 2) {
      return "February";
    } else if (x == 3) {
      return "March";
    } else if (x == 4) {
      return "April";
    } else if (x == 5) {
      return "May";
    } else if (x == 6) {
      return "June";
    } else if (x == 7) {
      return "July";
    } else if (x == 8) {
      return "August";
    } else if (x == 9) {
      return "September";
    } else if (x == 10) {
      return "October";
    } else if (x == 11) {
      return "November";
    } else if (x == 12) {
      return "December";
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: MessageDatabaseService().streamMessages(isar),
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
                return Column(children: [
                  (index < snapshot.data!.length - 1)
                      ? ((snapshot.data![index].dateTime.day !=
                                  DateTime.now().day) &&
                              (snapshot.data![index].dateTime.day !=
                                  snapshot.data![index + 1].dateTime.day))
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  snapshot.data![index].dateTime.day
                                          .toString() +
                                      ' ' +
                                      toWord(
                                          snapshot.data![index].dateTime.month),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : Container()
                      : Container(),
                  messageCard(
                    message: snapshot.data![index],
                    //icon: Icons.warning_amber_rounded,
                    icon: CupertinoIcons.antenna_radiowaves_left_right,
                    context: context,
                  ),
                ]);
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
