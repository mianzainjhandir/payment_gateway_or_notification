
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices {

  FirebaseMessaging messaging = FirebaseMessaging.instance ;

  void requestNotificationPermission() async{

    NotificationSettings settings = await messaging.requestPermission();
  }
}