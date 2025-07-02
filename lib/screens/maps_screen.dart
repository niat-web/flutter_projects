import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  Future<void> checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled. Please enable them.");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permissions are denied. Please allow them.");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location Permissions are permanently denied");
    }

    Position position = await Geolocator.getCurrentPosition();

    final url = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}",
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("could not launch google maps");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Maps Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: checkLocationPermission,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.map), SizedBox(width: 10), Text("Open Maps")],
          ),
        ),
      ),
    );
  }
}
