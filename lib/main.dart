import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:return_success_4_app/controller/messageDatabaseService.dart';
import 'package:return_success_4_app/controller/notificationService.dart';
import 'package:return_success_4_app/model/deviceModel.dart';
import 'package:return_success_4_app/view/homepage/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'model/messageModel.dart';
import 'view/editPage/edit.dart';
import 'view/infoPage/info.dart';
import 'view/settingsPage/settings.dart';

///Callback for when FCM messages are received when the app is either in the background or terminated
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  //await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");

  // Opening Isar
  var isar = Isar.getInstance('isar');

  print("before, isar is: $isar"); //PRINT 1
  if (isar == null) {
    print("Isar is not open, so opening it.");
    final dir = await getApplicationSupportDirectory();
    isar = await Isar.open(
      schemas: [MessageSchema, DeviceSchema],
      directory: dir.path,
    );
  }
  print("after, isar is: $isar"); //PRINT 2

  // Storing the message in the DB
  await MessageDatabaseService()
      .addToMessagesDB(isar, Message.fromJson(message.data));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize Isar DB
  final dir = await getApplicationSupportDirectory();
  final isar = await Isar.open(
    schemas: [MessageSchema, DeviceSchema],
    directory: dir.path,
  );

  // Initialize Firebase Cloud Messaging (FCM)
  var _fcm = NotificationService();
  _fcm.requestIOSPermissions();
  _fcm.setupHeadsUpNotifications();
  //await _fcm.printToken();
  // Set the foreground callback, for when messages are received and the app is in the foreground
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print('Got a message whilst in the foreground!');
    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
    MessageDatabaseService()
        .addToMessagesDB(isar, Message.fromJson(message.data));
  });
  // Set the background callback, for when messages are received and the app is either in the background or terminated
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // Subscribe to topics
  _fcm.subscribeToTopics(['global', 'testing']);

  // Run the App
  runApp(MyApp(isar: isar));
}

/// Flutter Material App, root of the application
class MyApp extends StatelessWidget {
  const MyApp({required this.isar, Key? key}) : super(key: key);

  final Isar isar;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notisound',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(isar: isar),
        '/settings': (context) => SettingsPage(isar: isar),
        '/info': (context) => const InfoPage(),
        '/edit': (context) => EditPage(isar: isar),
      },
    );
  }
}
