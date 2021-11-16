import 'package:flutter/material.dart';
import 'package:flutter_geo/app/ui/pages/home/painter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();
  Map<MarkerId, Marker> _makers = Map();

  final _initialCameraPosition =
      const CameraPosition(target: LatLng(13.7006742, -89.2038779), zoom: 14);
  _onTap(LatLng position) async {
    final markerId = MarkerId(_makers.length.toString());

    //final bytes = await _myPainterToBitmap(_makers.length.toString());
    final icon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(20, 20)), 'assets/img/auto.png');
    final bytes = await _myPainterToBitmap(position.toString());
    final maker = Marker(
        markerId: markerId,
        position: position,
        anchor: Offset(0.5, 0.5),
        icon: icon
        //BitmapDescriptor.fromBytes(bytes)
        );
    setState(() {
      _makers[markerId] = maker;
    });
  }

  // ignore: unused_element
  Future<Uint8List> _myPainterToBitmap(String label) async {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    Paiter myPainter = Paiter(label);
    myPainter.paint(canvas, const Size(300, 70));
    final ui.Image image = await recorder.endRecording().toImage(300, 70);
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        onMapCreated: _controller.onMapCreated,
        initialCameraPosition: _initialCameraPosition,
        markers: Set.of(_makers.values),
        onTap: _onTap,
      ),
      // Center(
      //  child: Container(
      /*  child: 
              width: 200,
              height: 50,
              child: CustomPaint(
                painter: Paiter(),
              ))),
*/
      /*Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              myLocationButtonEnabled: false,
            ),
          )
        ],
      ),*/
    );
  }
}
