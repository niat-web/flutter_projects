// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class SatelliteMapUI extends StatelessWidget {
//   const SatelliteMapUI({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       body: Stack(
//         children: [
//           // Satellite Map Background
//           FlutterMap(
//             options: MapOptions(
//               initialCenter: LatLng(37.7749, -122.4194) ,
//               initialZoom: 17,
//               interactionOptions: InteractionOptions(flags: InteractiveFlag.all),
//             ),
//             children: [
//               TileLayer(
//                 urlTemplate:
//                     'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                 subdomains: ['a', 'b', 'c'],
//               ),
//             ],
//           ),

//           // Top AppBar with Transparent Background
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: AppBar(
//               backgroundColor: Colors.black.withOpacity(0.3),
//               elevation: 0,
//               title: const Text('GREEN', style: TextStyle(color: Colors.white)),
//               actions: const [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 12.0),
//                   child: Icon(Icons.battery_charging_full, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),

//           // Left Column Buttons
//           Positioned(
//             top: 100,
//             left: 10,
//             child: Column(
//               children: [
//                 _iconBtn(Icons.flight),
//                 const SizedBox(height: 10),
//                 _iconBtn(Icons.pause),
//                 const SizedBox(height: 10),
//                 _iconBtn(Icons.settings),
//               ],
//             ),
//           ),

//           // Bottom Left Information Panel
//           Positioned(
//             left: 10,
//             bottom: 10,
//             child: Container(
//               width: 200,
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.4),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   _infoRow('Alt', '2.5 m'),
//                   _infoRow('Speed', '15.9 m/s'),
//                   _infoRow('Area', '10 Acre'),
//                   _infoRow('Distance', '20 m'),
//                   _infoRow('Consumed', '2.0 ml'),
//                 ],
//               ),
//             ),
//           ),

//           // You can add more widgets like center arrows, path lines, etc., using Flutter widgets on top
//         ],
//       ),
//     );
//   }

//   Widget _iconBtn(IconData icon) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.black.withOpacity(0.3),
//         shape: BoxShape.circle,
//       ),
//       child: IconButton(
//         icon: Icon(icon),
//         color: Colors.white,
//         onPressed: () {},
//       ),
//     );
//   }
// }

// class _infoRow extends StatelessWidget {
//   final String label;
//   final String value;
//   const _infoRow(this.label, this.value);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: const TextStyle(color: Colors.white, fontSize: 14),
//           ),
//           Text(
//             value,
//             style: const TextStyle(color: Colors.white, fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }
// }
