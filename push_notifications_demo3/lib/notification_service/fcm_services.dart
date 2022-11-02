import 'package:firebase_messaging/firebase_messaging.dart';
import 'local_notification_service.dart';


class FcmMethodsClass{

  var onTerminated =  FirebaseMessaging.instance.getInitialMessage().then(
        (message) {
      print("FirebaseMessaging.instance.getInitialMessage");
      if (message != null) {
        print("New Notification");
        LocalNotificationService.createAndDisplayNotification(message);
        // if (message.data['_id'] != null) {
        //   Navigator.of(context).push(
        //     MaterialPageRoute(
        //       builder: (context) => DemoScreen(
        //         id: message.data['_id'],
        //       ),
        //     ),
        //   );
        // }
      }
    },
  );

  var onForeground =  FirebaseMessaging.onMessage.listen(  //  This method only called when App in foreground
        (message) {
      print("FirebaseMessaging.onMessage.listen");
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.data11 ${message.data}");
        LocalNotificationService.createAndDisplayNotification(message);

      }
    },
  );

  var onBackground = FirebaseMessaging.onMessageOpenedApp.listen( //  This method only call when App in background and not terminated
        (message) {
      print("FirebaseMessaging.onMessageOpenedApp.listen");
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.data22 ${message.data['_id']}");
         LocalNotificationService.createAndDisplayNotification(message);
      }
    },
  );



}