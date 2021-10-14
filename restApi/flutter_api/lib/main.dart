import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/models/ApiGif.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(FlutterApi());
}

class FlutterApi extends StatefulWidget {
  // FlutterApi({Key? key}) : super(key: key);

  @override
  _FlutterApiState createState() => _FlutterApiState();
}

class _FlutterApiState extends State<FlutterApi> {
  late Future<List<ApiGif>> _listaImg;

  Future<List<ApiGif>> _getImg() async {
    String cuerpo;
    final respose = await http.get(Uri.parse(
        'https://api.giphy.com/v1/gifs/trending?api_key=JXXyjoYb80tsIuRkV7OgzMwUjbjyEGHH&limit=10&rating=g'));
    List<ApiGif> pict = [];
    if (respose.statusCode == 200) {
      print(respose.body);
      cuerpo = utf8.decode(respose.bodyBytes);
      final jsonData = jsonDecode(cuerpo);
      for (var item in jsonData["data"]) {
        pict.add(ApiGif(item["title"], item["images"]["downsized"]["url"]));
      }

      //print(jsonData["data"][0]["type"]);
    } else {
      throw Exception("No se puede conectar");
    }
    return pict;
  }

  void initState() {
    super.initState();
    _listaImg = _getImg();
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder(
      future: _listaImg,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data);
          //  return Text("Correcto");
          return ListView(
            children: _listaImgs(snapshot.data),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Text("Error");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    return MaterialApp(
      title: "Mi aplicacion",
      home: Scaffold(
          appBar: AppBar(
            title: Text('API'),
          ),
          body: futureBuilder),
    );
  }

  List<Widget> _listaImgs(data) {
    List<Widget> imag = [];
    for (var itemg in data) {
      imag.add(Card(
          child: Column(children: [
        Image.network(itemg.url),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(itemg.name),
        )
      ])));
    }
    return imag;
  }
}
