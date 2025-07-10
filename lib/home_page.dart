import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_drone/satellite_google_map.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Satellite Map'),
          onPressed: () async {
            // Set landscape mode before navigating
            await SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ]);

            // Navigate to Satellite Page
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SatelliteMapUI()),
            );

            // Restore portrait after returning
            await SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
          },
        ),
      ),
    );
  }
}
