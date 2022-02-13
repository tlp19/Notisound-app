import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:return_success_4_app/view/homePage/homepage_widgets.dart';
import 'package:return_success_4_app/view/settingsPage/settings.dart';

import '../addPage/add.dart';
import '../editPage/edit.dart';
import 'messageHistoryList.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return SizedBox(
        height: (MediaQuery.of(context).size.height / 4),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Notisound',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconButton(
                      icon: Icons.add_outlined,
                      color: Color.fromARGB(255, 140, 207, 155),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddPage()));
                      }),
                  SizedBox(width: 32),
                  iconButton(
                      icon: Icons.edit_outlined,
                      color: Color.fromARGB(255, 116, 142, 207),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditPage()));
                      }),
                  SizedBox(width: 32),
                  iconButton(
                      icon: Icons.settings_outlined,
                      color: Color.fromARGB(255, 159, 163, 172),
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage()));
                      }),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            header(),
            SizedBox(
              height: 60,
            ),
            const MessagesHistoryListView(),
          ],
        ),
      ),
    );
  }
}
