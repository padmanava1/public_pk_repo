import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'notifications/presentation/notification_service/local_notification_service.dart';

import 'notifications/presentation/pages/homescreen.dart';


Future<void> backgroundHandler(RemoteMessage message) async {   //to start and handle background services of firebase
  print(message.data.toString());
  print(message.notification!.title);
}



void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);  //to start background services
  LocalNotificationService.initialize(); // to inititalize notification
  
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Notifications'),
    );
  }
}

