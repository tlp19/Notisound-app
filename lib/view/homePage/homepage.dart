import 'package:flutter/material.dart';
import 'package:return_success_4_app/view/homepage/homepage_widgets.dart';

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
                      onPressed: () {
                        print("add");
                      }),
                  SizedBox(width: 32),
                  iconButton(
                      icon: Icons.edit_outlined,
                      onPressed: () {
                        print("edit");
                      }),
                  SizedBox(width: 32),
                  iconButton(
                      icon: Icons.settings_outlined,
                      onPressed: () {
                        print("settings");
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
