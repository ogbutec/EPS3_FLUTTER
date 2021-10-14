import 'package:flutter/material.dart';
import 'package:cafesv/Principal/componetes/CafeLista.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Cafeelista(), //Text("Saludos"),
      ),
    );
  }
}
