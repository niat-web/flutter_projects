// Flutter Map with Drone Movement Simulation

// File: screens/map_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<LatLng> waypoints = [
    LatLng(17.3850, 78.4867), // Hyderabad
    LatLng(17.3900, 78.4900),
    LatLng(17.3950, 78.4950),
    LatLng(17.4000, 78.5000),
  ];

  late LatLng dronePosition;
  int currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    dronePosition = waypoints[0];
    _startDroneMovement();
  }

  void _startDroneMovement() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (currentIndex < waypoints.length - 1) {
        currentIndex++;
        setState(() {
          dronePosition = waypoints[currentIndex];
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drone Map Tracker')),
      body: FlutterMap(
        options: MapOptions(initialZoom: 15.0, initialCenter: dronePosition),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          MarkerLayer(
            markers: [
              for (var point in waypoints)
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: point,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
              Marker(
                width: 50.0,
                height: 50.0,
                point: dronePosition,
                child: const Icon(
                  Icons.airplanemode_active,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
          PolylineLayer(
            polylines: [
              Polyline(points: waypoints, strokeWidth: 4, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}
