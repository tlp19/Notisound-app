import 'package:flutter/material.dart';
import 'package:return_success_4_app/controller/notificationServices.dart';
import 'package:return_success_4_app/view/homepage/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var _fcm = FCMService();
  await _fcm.requestIOSPermissions();
  await _fcm.setupHeadsUpNotifications();
  await _fcm.printToken();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notisound',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}
