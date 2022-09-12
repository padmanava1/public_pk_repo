import 'package:flutter/material.dart';

import '../notification_service/fcm_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  
  @override
  void initState() {
    super.initState();

    FcmMethodsClass fcmMethodsClass = FcmMethodsClass();

    fcmMethodsClass.onTerminated;    // This method is called when app is in terminated state and you get a notification
    fcmMethodsClass.onForeground;    // This method only called when App in foreground
    fcmMethodsClass.onBackground;    // This method only call when App in background and not terminated
  }
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Notification Page',
            ),
            Text(
              'Test your notofications',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

