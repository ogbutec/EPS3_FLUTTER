import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:firebase_picture_uploader/firebase_picture_uploader.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SubirFoto extends StatefulWidget {
  @override
  _subirFotoState createState() => _subirFotoState();
}

class _subirFotoState extends State<SubirFoto> {
  File? sampleImage;
  String? campo;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subir Fotografia"),
        centerTitle: true,
      ),
      body: Center(
        child:
            sampleImage == null ? Text("Seleccionar Imagen") : enableUpload(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: "Agregar Imagen",
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future getImage() async {
    final imagenPicker = ImagePicker();
    var imagengaGallery =
        await imagenPicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage = File(imagengaGallery!.path);
    });
  }

  Widget enableUpload() {
    return Container(
      child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Image.file(sampleImage!, height: 300.0, width: 600.0),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Descripcion"),
                validator: (value) {
                  return value!.isEmpty ? "El campo es requerido" : null;
                },
                onSaved: (value) {
                  campo = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                child: Text("Guardar"),
                onPressed: subirImg, //validarGuardar,
              )
            ],
          )),
    );
  }

  void subirImg() async {
    if (validarGuardar()) {
      final StorageReference imgUpload =
          FirebaseStorage.instance.ref().child("Guardar") as StorageReference;
      var horaKey = DateTime.now();
      imgUpload.child(horaKey.toString() + ".jpg").put(sampleImage);
      //var imgRuta = await (await UploadTask.onComplete).ref.getDowloadURL();
    }
  }

  bool validarGuardar() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
