import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:projectiot/app.dart';
import 'package:projectiot/core/di/injection.dart';
import 'package:projectiot/core/service/background_handler.dart';
import 'package:projectiot/core/service/cloud_messaging.dart';
import 'package:projectiot/core/service/local_notification_service.dart';
import 'package:projectiot/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CloudMessaging.initialNotification();
  CloudMessaging.localNotification();
  LocalNotificationService.initializeLocalNotification();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await authInjection();
  await dashboardInjection();
  runApp(MyApp());
}
