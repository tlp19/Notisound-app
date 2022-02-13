import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import '../../controller/databaseService.dart';
import '../../model/messageModel.dart';
import 'homepage_widgets.dart';

class MessagesHistoryListView extends StatelessWidget {
  const MessagesHistoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: DatabaseService().messagesBox.listenable(),
      builder: (context, Box<Message> box, widget) {
        return ListView.builder(
          reverse: true,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: box.length,
          itemBuilder: (BuildContext context, int index) {
            Message? message = DatabaseService().messagesBox.get(index);

            return (message == null)
                ? Container()
                : messageCard(
                    message: message,
                    icon: Icons.doorbell_outlined,
                    context: context,
                  );
          },
        );
      },
    );
  }
}
