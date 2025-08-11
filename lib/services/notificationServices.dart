import 'dart:typed_data';
import 'package:flutter_application_1/utils/translator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

   static Future<void> init() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
        InitializationSettings(android: androidSettings);

    await _notificationsPlugin.initialize(initSettings);
    tz.initializeTimeZones(); // penting untuk zoned schedule
  }

  static Future<void> showSimpleNotification({
    required String title,
    required String body,
    //required DateTime scheduledDate,
  }) async {
    await _notificationsPlugin.show(
      0,
      title,
      body,
       const NotificationDetails(
      android: AndroidNotificationDetails(
        'main_channel',
        'Main Channel',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
      ),
    ),
      
    );
  }

  static void scheduleNotification(
    {required int id, 
    required String title, 
    required String body, 
    required DateTime scheduledDate}) async{
      await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
       NotificationDetails(
        android: AndroidNotificationDetails(
          'main_channel',
          'Main Channel',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true, 
          enableVibration: true, vibrationPattern: Int64List.fromList([0, 1000, 500, 2000]),
          styleInformation: BigTextStyleInformation(''), // agar bisa banyak teks
          ticker: 'ticker',// tambahkan jika ingin ada suara
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
    );
    }
}
