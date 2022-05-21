import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  initNotifications() {
    firebaseMessaging.requestPermission();
    firebaseMessaging.getToken().then((token) {
      print('------------ FCM token -----------');
      print(token);
    });
  }
}
