import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

CollectionReference collectionReference =
    FirebaseFirestore.instance.collection("usuarios");
//**** select */

void getUsuarios() async {
  QuerySnapshot usuarios = await collectionReference.get();
  if (usuarios.docs.length != 0) {
    for (var documentos in usuarios.docs) {
      print(documentos.data());
      //user.add(documentos.data());
    }
  }
}

//insert

void InsertarUsuario() async {
  return collectionReference
      .add({
        'nombre': 'Claudia Lopez',
        'ocupacion': 'Secretaria',
        'genero': 'Femenino'
      })
      .then((value) => print("Registro agregado"))
      .catchError((error) => print("Fallo en insertar registro:$error"));
}

void actualizarUsuario() async {
  return collectionReference
      .doc('BXWYgYx6hlo8q9j9LmEN')
      .update({'ocupacion': 'Gerente'})
      .then((value) => print("Registro Actualizado"))
      .catchError((error) => print("Fallo en Actualizar registro:$error"));
}

void borrarUsuario() async {
  return collectionReference
      .doc('BXWYgYx6hlo8q9j9LmEN')
      .delete()
      .then((value) => print("Registro Borrado"))
      .catchError((error) => print("Fallo en Borrar registro:$error"));
}
