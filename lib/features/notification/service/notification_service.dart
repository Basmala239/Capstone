import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{
  final notificationPlugin= FlutterLocalNotificationsPlugin();

  bool isInitialized = false;
  // init
  Future<void> initNotification() async{
    if(isInitialized) return;

    const initSettingAndroid= AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettingIOS= DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true
    );

    const initSettings = InitializationSettings(
      android: initSettingAndroid,
      iOS: initSettingIOS
    );

    await notificationPlugin.initialize(initSettings);
  }
  // detail setup
  NotificationDetails notificationDetails(){
    return const NotificationDetails(
      android:  AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notification',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.min,
        priority: Priority.high
      ),
      iOS: DarwinNotificationDetails(),
    );
  }
  // show
  Future<void>showNotification({int id=0, String? title, String? body})async{
    print(body);
    return notificationPlugin.show(id, title, body, NotificationDetails());
  }
}