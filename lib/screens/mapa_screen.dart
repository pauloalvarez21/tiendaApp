import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapaScreen extends StatefulWidget {
  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  MapboxMapController? mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mapa'),
        ),
        body: MapboxMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
              target: LatLng(4.612639, -74.0705), zoom: 14),
        ));
  }
}
