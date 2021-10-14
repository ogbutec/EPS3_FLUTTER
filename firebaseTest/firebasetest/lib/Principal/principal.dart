import 'package:firebasetest/Principal/formulario.dart';
import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CRUD",
      home: Formulario(),
    );
  }
}
