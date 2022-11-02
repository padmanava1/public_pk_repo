import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class  NotificationServices{
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  
  final AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('logo');


  void initialiseNotifications() async{
    //to initialise notifications
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
    );
   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }


  void sendNotification(String title, String body) async{
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        "channelId",
        "channelName",
    importance: Importance.high,
      priority: Priority.high
    );
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails
    );
    await flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        notificationDetails);
  }

  void scheduleNotification(String title, String body) async{

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        "channelId",
        "channelName",
        importance: Importance.high,
        priority: Priority.high
    );

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails
    );

    await flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        title,
        body,
        RepeatInterval.everyMinute,
        notificationDetails);
  }


  void stopNotifications() async{
    flutterLocalNotificationsPlugin.cancel(0);//this is id accepted from else where I've passed 0 in
  }


}