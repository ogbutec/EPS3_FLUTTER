import 'package:flutter/material.dart';
import 'Contenidos/UploadPhoto.dart';

class Principal extends StatefulWidget {
  @override
  _principalState createState() => _principalState();
}

class _principalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Principal"),
      ),
      body: Container(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.add_a_photo),
                  iconSize: 40,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SubirFoto();
                    }));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
