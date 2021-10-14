import 'package:compras/Principal/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppStore());
}

class AppStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Store app",
        theme: ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        home: Principal());
  }
}
