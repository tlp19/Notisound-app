import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FCMService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> printToken() async {
    String? token = await messaging.getToken();
    print(token);
  }

  /// Request permissions to send notifications on iOS (not needed for Android)
  Future<void> requestIOSPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  /// Setup Heads-up notifications (pop-up style) for both iOS and Android
  Future<void> setupHeadsUpNotifications() async {
    // For iOS:
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    // For Android:
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // name
      description: "This channel is used for delivery of FCM notifications",
      importance: Importance.max,
    );
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  /// Subscribe to the FCM topics in the list
  Future<void> subscribeToTopics(
      FirebaseMessaging messaging, List<String> topics) async {
    for (String topic in topics) {
      await FirebaseMessaging.instance.subscribeToTopic(topic);
    }
  }
}
