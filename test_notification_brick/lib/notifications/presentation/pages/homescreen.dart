import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:test_notification_brick/notifications/presentation/Events/base_events.dart';

import '../notification_service/fcm_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final facebookAppEvents = FacebookAppEvents();
  final baseEvents = BaseEvent();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  void initState() {
    super.initState();

    // FcmMethodsClass fcmMethodsClass = FcmMethodsClass();
    //
    // fcmMethodsClass
    //     .onTerminated; // This method is called when app is in terminated state and you get a notification
    // fcmMethodsClass
    //     .onForeground; // This method only called when App in foreground
    // fcmMethodsClass
    //     .onBackground; // This method only call when App in background and not terminated
    //
    //  FirebaseAnalytics.instance.setCurrentScreen(screenName: "HomePage");


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
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () async {
                  // FirebaseAnalytics.instance.logEvent(
                  //     name: "Add_Button",
                  //     parameters: {"pushed_time": "$_counter"}); //Firebase analytics
                  //
                  // facebookAppEvents.logEvent(
                  //     name: "Add_Button",
                  //     parameters: {"pushed_time": "$_counter"});
                  baseEvents.facebookAppEvents.logEvent(name: "add");
                  baseEvents.firebaseShowEvent("Add2", {"guj":"guj"});

                  _decrementCounter();
                },
                child: Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  // FirebaseAnalytics.instance.logEvent(
                  //     name: "Remove_Button",
                  //     parameters: {"pushed_time": "$_counter"});
                  // facebookAppEvents.logEvent(
                  //     name: "Remove_Button",
                  //     parameters: {"pushed_time": "$_counter"});
                  baseEvents.firebaseShowEvent("Remove2", {"pushed_time":"$_counter"});
                  baseEvents.facebookShowEvent("Remove2", {"pushed_time":"$_counter"});
                  _incrementCounter();
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  // FirebaseAnalytics.instance.logEvent(
                  //     name: "Remove_Button",
                  //     parameters: {"pushed_time": "$_counter"});
                  // facebookAppEvents.logEvent(
                  //     name: "Remove_Button",
                  //     parameters: {"pushed_time": "$_counter"});
                  baseEvents.firebaseShowEvent("AndroidButton", {"pushed_time":"$_counter"});
                  baseEvents.facebookShowEvent("AndroidButton", {"pushed_time":"$_counter"});
                  _incrementCounter();
                },
                child: Icon(Icons.android),
              ),
            ])
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
