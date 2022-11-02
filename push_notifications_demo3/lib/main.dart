import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'notification_service/fcm_services.dart';
import 'notification_service/local_notification_service.dart';
import 'views/homescreen.dart';

Future<void> backgroundHandler(RemoteMessage message) async {   //to start and handle background services of firebase
  // print(message.data.toString());
  // print(message.notification!.title);
  FcmMethodsClass fcmMethodsClass = FcmMethodsClass();

  fcmMethodsClass.onTerminated;    // This method is called when app is in terminated state and you get a notification
  fcmMethodsClass.onForeground;    //  his method only called when App in foreground
  fcmMethodsClass.onBackground;

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

    FirebaseMessaging.instance
        .getToken()
        .then((value) => print("device_id  ${value}"));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

