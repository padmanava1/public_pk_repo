import 'package:firebase_messaging/firebase_messaging.dart';
import 'local_notification_service.dart';


class FcmMethodsClass{

  var onTerminated =  FirebaseMessaging.instance.getInitialMessage().then(
        (message) {
      if (message != null) {
       //todo:
      }
    },
  );

  var onForeground =  FirebaseMessaging.onMessage.listen(  //  This method only called when App in foreground
        (message) {
      if (message.notification != null) {
        //todo:
        LocalNotificationService.createAndDisplayNotification(message);

      }
    },
  );

  var onBackground = FirebaseMessaging.onMessageOpenedApp.listen( //  This method only call when App in background and not terminated
        (message) {
      if (message.notification != null) {
        //todo:
      }
    },
  );



}