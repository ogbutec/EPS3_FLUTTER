import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  Formulario({Key? key}) : super(key: key);

  @override
  _formularioState createState() => _formularioState();
}

class _formularioState extends State<Formulario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD - FIREBASE"),
      ),
      body: Center(
        child: Text("Mensaje"),
      ),
    );
  }
}
