
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices {

  FirebaseMessaging messaging = FirebaseMessaging.instance ;

  void requestNotificationPermission() async{

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print("User Granted Permission");
    }else if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print("User Granted Provided Permission");
    }else{
      print("User denied Permission");
    }
  }
}