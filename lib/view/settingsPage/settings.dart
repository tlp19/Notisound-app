import 'package:flutter/material.dart';
import 'package:return_success_4_app/controller/databaseService.dart';

import '../homePage/homepage_widgets.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: iconButton(
            icon: Icons.delete_outline,
            color: Color.fromARGB(255, 224, 116, 116),
            onPressed: () async {
              await DatabaseService().clearMessagesBox();
            }),
      ),
    );
  }
}
