import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:projectiot/core/service/local_notification_service.dart';

class CloudMessaging {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static Future<void> initialNotification() async {
    await _firebaseMessaging.requestPermission();
  }

  static Future<String?> tokenFM() async {
    return await _firebaseMessaging.getToken();
  }

  static Future<void> localNotification() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) async {
      if (message != null) {
        await LocalNotificationService.showFlutterNotification(
          message.notification!.body.toString(),
          message.notification!.title.toString(),
        );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) async {
      if (message != null) {
        await LocalNotificationService.showFlutterNotification(
          message.notification!.body.toString(),
          message.notification!.title.toString(),
        );
      }
    });
    final message = await _firebaseMessaging.getInitialMessage();
    if (message != null) {
      await LocalNotificationService.showFlutterNotification(
        message.notification!.body.toString(),
        message.notification!.title.toString(),
      );
    }
  }
}
