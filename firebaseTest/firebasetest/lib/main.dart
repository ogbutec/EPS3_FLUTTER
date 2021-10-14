import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Basededatos/cotroller.dart';
import 'Principal/principal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(CRUDapp());
  });
}

class CRUDapp extends StatelessWidget {
  const CRUDapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CRUD - FireBase",
      home: cudApp(),
    );
  }
}

class cudApp extends StatefulWidget {
  cudApp({Key? key}) : super(key: key);

  @override
  _cudAppState createState() => _cudAppState();
}

class _cudAppState extends State<cudApp> {
//List user = [];
  void initState() {
    super.initState();
    //InsertarUsuario();
    //getUsuarios();
    actualizarUsuario();
    getUsuarios();
    borrarUsuario();
    getUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
