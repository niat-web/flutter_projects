import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_drone/custom_app_bar.dart';
import 'package:project_drone/transparent_box.dart';

class SatelliteMapUI extends StatefulWidget {
  const SatelliteMapUI({super.key});

  @override
  State<SatelliteMapUI> createState() => _SatelliteMapUIState();
}

class _SatelliteMapUIState extends State<SatelliteMapUI> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.7749, -122.4194); // Example location

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 17),
            mapType: MapType.satellite,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),
          CustomDroneAppBar(),
          // Transparent Top AppBar
          //  Positioned(
          //     top: 0,
          //     left: 0,
          //     right: 0,
          //     child: AppBar(
          //       backgroundColor: Colors.black.withOpacity(0.3),
          //       elevation: 0,
          //       titleSpacing: 0,
          //       title: Row(
          //         children: [
          //           IconButton(
          //             icon: const Icon(Icons.menu, color: Colors.white),
          //             onPressed: () {},
          //           ),
          //           IconButton(
          //             icon: const Icon(Icons.home, color: Colors.white),
          //             onPressed: () {},
          //           ),
          //           const SizedBox(width: 8),
          //           const Text(
          //             'GREEN',
          //             style: TextStyle(
          //               color: Colors.white,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //           const Spacer(), // Push right-side content to the end
          //           Row(
          //             children: [
          //               _infoColumn(
          //                 Icons.battery_charging_full,
          //                 '12600 V',
          //                 Colors.white,
          //               ),
          //               _verticalDivider(),
          //               _infoColumn(Icons.gamepad_outlined, 'Arm', Colors.red),
          //               _verticalDivider(),
          //               _infoColumn(Icons.gamepad_outlined, 'Arm', Colors.red),
          //               _verticalDivider(),
          //               _infoColumn(
          //                 Icons.gamepad_outlined,
          //                 'Armakjkajlka',
          //                 Colors.red,
          //               ),
          //             ],
          //           ),
          //           const SizedBox(width: 12), // Padding at end
          //         ],
          //       ),
          //     ),
          //   ),

          // Left Column Controls
          Positioned(
            top: 50,
            left: 10,
            child: Column(
              children: [
                _iconBtn(Icons.flight),
                const SizedBox(height: 6),
                _iconBtn(Icons.location_city_outlined),
                const SizedBox(height: 6),
                _iconBtn(Icons.pause),
                const SizedBox(height: 6),
                _iconBtn(Icons.play_arrow_outlined),
              ],
            ),
          ),

          // Bottom Left Info Box
          Positioned(left: 10, bottom: 6, child: MapOverlayInfo()),
        ],
      ),
    );
  }

  Widget _iconBtn(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon),
        color: Colors.white,
        iconSize: 20,
        onPressed: () {},
      ),
    );
  }
}

class _infoText extends StatelessWidget {
  final String text;
  const _infoText(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
}

Widget _infoColumn(IconData icon, String label, Color iconColor) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: iconColor, size: 20),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

Widget _verticalDivider() {
  return Container(color: Colors.white, width: 1, height: 30);
}
