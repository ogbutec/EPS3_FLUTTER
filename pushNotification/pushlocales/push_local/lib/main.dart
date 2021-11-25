// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:push_local/src/providers/push_notification_provider.dart';

void main() {
  runApp(const PushFlutter());
}

class Notifica extends StatefulWidget {
  const Notifica({Key? key}) : super(key: key);

  @override
  _NotificaState createState() => _NotificaState();
}

class _NotificaState extends State<Notifica> {
  @override
  void initState() {
    super.initState();
    final pushProvider = PushNotificationProvider();
    pushProvider.initNotifications();

    //clase 22/11/2021
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PushFlutter extends StatelessWidget {
  const PushFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Push locales',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Barra push locales'),
          ),
          body: Center(
            child: Container(
              child: const Text('Notificaciones'),
            ),
          ),
        ));
  }
}
