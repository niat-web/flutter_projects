import 'package:flutter/material.dart';

class CustomDroneAppBar extends StatelessWidget {
  const CustomDroneAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 60,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF145A32),
              Color(0xFF28B463),
            ], // dark to light green
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.menu, color: Colors.white),
            const SizedBox(width: 8),
            const Icon(Icons.home, color: Colors.white),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'GREEN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Req ID : AB52365987',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                _infoBlock(Icons.flight, "13%"),
                _divider(),
                _infoBlock(Icons.battery_full, "12.600 V"),
                _divider(),
                _infoBlock(Icons.gamepad, "100%"),
                _divider(),
                _infoBlockGroup(Icons.bolt, ["561 mAh", "28.12 A"]),
                _divider(),
                _infoBlockGroup(Icons.satellite_alt, ["10 sats", "1.2 hdop"]),
                _divider(),
                _infoBlockGroup(Icons.sync_alt, ["Stabilize", "Arm"]),
                _divider(),
                const Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() => Container(
    width: 1,
    height: 30,
    color: Colors.white.withOpacity(0.7),
    margin: const EdgeInsets.symmetric(horizontal: 8),
  );

  Widget _infoBlock(IconData icon, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 18),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget _infoBlockGroup(IconData icon, List<String> values) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 18),
        for (var val in values)
          Text(val, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}