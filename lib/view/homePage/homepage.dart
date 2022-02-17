import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:return_success_4_app/view/homePage/homepage_widgets.dart';

import 'messageHistoryList.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.isar, Key? key}) : super(key: key);

  final Isar isar;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Sets-up how a click on a notification is handled, from both the Terminated and Background states
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from a TERMINATED state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    // Also handle any interaction when the app is in the BACKGROUND via a Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  /// Function executed when a notification is clicked (currently common for both Terminated and Background states)
  void _handleMessage(RemoteMessage message) {
    //Navigator.pushNamed(context, '/');
  }

  @override
  void initState() {
    super.initState();
    // Setup the handling of interacted messages
    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return SizedBox(
        height: (MediaQuery.of(context).size.height / 4),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Notisound',
                style: TextStyle(
                  fontSize: 42,
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
                    icon: Icons.refresh_outlined,
                    color: const Color.fromARGB(255, 134, 194, 196),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/');
                    },
                  ),
                  const SizedBox(width: 24),
                  iconButton(
                      icon: Icons.settings_outlined,
                      color: const Color.fromARGB(255, 187, 196, 207),
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            header(),
            const SizedBox(
              height: 16,
            ),
            MessagesHistoryListView(isar: widget.isar),
          ],
        ),
      ),
    );
  }
}
