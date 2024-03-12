import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService() {
    tz.initializeTimeZones();
    tz.setLocalLocation(
        tz.getLocation('Asia/Colombo')); // Set Sri Lanka's timezone
  }

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> scheduleDailyReminder() async {
    // Generate a random time within the next 24 hours
    final Random random = Random();
    final int randomHours = random.nextInt(24);
    final int randomMinutes = random.nextInt(60);
    final DateTime scheduledTime = DateTime.now()
        .add(Duration(hours: randomHours, minutes: randomMinutes));

    // Convert the DateTime object to TZDateTime
    final tz.TZDateTime scheduledDateTime =
        tz.TZDateTime.from(scheduledTime, tz.local);

    // Define the notification details with correct parameters
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'daily_reminder_channel_id', // channelId
            'Daily Reminder', // channelName
            channelDescription:
                'Reminds you to add your Income and Expenses to the report for today', // channelDescription
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // Schedule the notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Daily Reminder',
        'Hey!, It’s time to add your Income and Expenses to the report for today :)',
        scheduledDateTime,
        platformChannelSpecifics,
        // ignore: deprecated_member_use
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
