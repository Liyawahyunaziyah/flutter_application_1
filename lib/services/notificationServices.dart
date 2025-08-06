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

  static void scheduleNotification({required int id, required String title, required String body, required DateTime scheduledDate}) {}
}
