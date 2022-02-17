import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:return_success_4_app/controller/databaseService.dart';

import '../editPage/edit.dart';
import '../general_widgets.dart';
import '../homePage/homepage_widgets.dart';
import '../infoPage/info.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({required this.isar, Key? key}) : super(key: key);

  final Isar isar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            iconButton(
                label: "Information",
                icon: Icons.info_outlined,
                color: const Color.fromARGB(255, 228, 227, 155),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InfoPage()));
                }),
            const SizedBox(height: 24),
            iconButton(
                label: "Add or edit devices",
                icon: Icons.mode_edit_outlined,
                color: const Color.fromARGB(255, 141, 177, 224),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditPage()));
                }),
            const SizedBox(height: 24),
            iconButton(
              label: "Clear stored messages",
              icon: Icons.delete_outline,
              color: const Color.fromARGB(255, 219, 139, 139),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => buildPopupDialog(
                      context: context,
                      dialogTitle: "Warning",
                      dialogContent: [
                        const Text(
                          'Are you sure you want to delete all stored messages?',
                        )
                      ],
                      buttonText: "Clear all",
                      onButtonPressed: () async {
                        await DatabaseService().clearMessagesDB(isar);
                      }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
