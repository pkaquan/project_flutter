import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static Future<void> showFlutterNotification(String body, String title) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'CHANNEL_ID',
          'CHANNEL_NAME',
          channelDescription: 'Notification channel for basic test',
          priority: Priority.high,
          importance: Importance.max,
        );
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
          presentAlert: true,
          presentSound: true,
          presentBadge: true,
        );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  static Future<void> initializeLocalNotification() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/domotics');
    const DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: androidInitializationSettings,
          iOS: darwinInitializationSettings,
        );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
}
