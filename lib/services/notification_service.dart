// lib/services/notification_service.dart

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:vocablo_app/main.dart';
import 'package:vocablo_app/screens/practice_screen.dart';

class NotificationService {
  // Singleton pattern
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // Initialize timezone package
    tz.initializeTimeZones();
    final String timeZoneName = await tz.local.name;
    tz.setLocalLocation(tz.getLocation(timeZoneName));

    // Android initialization
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            '@drawable/ic_notification'); // Ensure this icon exists

    // iOS initialization
    // final IOSInitializationSettings initializationSettingsIOS =
    //     IOSInitializationSettings(
    //   requestSoundPermission: true,
    //   requestBadgePermission: true,
    //   requestAlertPermission: true,
    //   onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    // );

    // Initialization settings for all platforms
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      // iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    // Create notification channels
    await _createNotificationChannels();
  }

  Future<void> _createNotificationChannels() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'vocablo_channel_id', // id
      'Vocablo Notifications', // title
      description: 'Channel for Vocablo app notifications',
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  // For iOS (older versions)
  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // Handle the received notification, perhaps show a dialog
  }

  // Handle notification taps
  Future<void> onDidReceiveNotificationResponse(
      NotificationResponse response) async {
    final String? payload = response.payload;
    if (payload != null) {
      // Navigate to a specific screen based on the payload
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => PracticeScreen(payload: payload),
        ),
      );
    }
  }

  // Example method to show a notification
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'vocablo_channel_id',
      'Vocablo Notifications',
      channelDescription: 'Channel for Vocablo app notifications',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      //iOS: IOSNotificationDetails(),
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  // Additional methods like scheduling can be added here
}

final notificationService = NotificationService();
