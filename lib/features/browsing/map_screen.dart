import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../common/widgets/appbar/appbar.dart';

class MapScreen extends StatelessWidget {
  final String gpsCoordinates;

  const MapScreen({required this.gpsCoordinates, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // A GPS koordináták stringből való átalakítása LatLng típussá
    final coordinates = gpsCoordinates.split(',');
    final latitude = double.parse(coordinates[0]);
    final longitude = double.parse(coordinates[1]);
    final center = LatLng(latitude, longitude); // LatLng objektum létrehozása

    return Scaffold(
      appBar: TAppBar(
        title: const Text('Térkép'),
        showBackArrow: true,
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: center, // A térkép középpontja a megadott koordináták
          initialZoom: 13, // Kezdő zoom szint
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: center,
                child: Container( // Használjuk a child paramétert
                  child: Icon(
                    Icons.circle,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
