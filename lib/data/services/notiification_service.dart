import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin fl = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('flutter_logo');

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
    );

    try {
      await fl.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (response) async {},
      );
    } catch (e) {
      print('Error initializing FlutterLocalNotificationsPlugin: $e');
    }
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        "channelId",
        "channelName",
        importance: Importance.max,
      ),
    );
  }

  Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    try {
      await fl.show(id, title, body, await notificationDetails());
    } catch (e) {
      print('Error showing notification: $e');
    }
  }

  Future<void> requestLocationPermission() async {
    // Request location permission
    final status = await Permission.location.request();

    // Check if permission was granted
    if (status.isGranted) {
      print('Request Granted');
    } else if (status.isDenied) {
      openAppSettings();
    } else if (status.isPermanentlyDenied) {
      print('We never ask you again');
    }
  }
}
