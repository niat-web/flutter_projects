import 'package:flutter/material.dart';

class MapOverlayInfo extends StatelessWidget {
  const MapOverlayInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: 300, // Adjust to control how many items fit in one row
          child: Wrap(
            spacing: 20,
            runSpacing: 6,
            children: _infoItems.map((item) {
              return SizedBox(
                width: (300 - 3 * 20) / 4, // For exactly 4 items in 300 width
                child: InfoItem(label: item.label, value: item.value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

// Dummy Data Model
class InfoData {
  final String label;
  final String value;

  InfoData(this.label, this.value);
}

// Sample data list
final List<InfoData> _infoItems = [
  InfoData("Alt", "2.5 (m)"),
  InfoData("Speed", "15.9 (m/s)"),
  InfoData("Area", "10 (Acre)"),
  InfoData("Distance", "20m"),
  InfoData("Consumed", "2.0 (ml)"),
  InfoData("Flow Rate", "0 (L/min)"),
  InfoData("Obs Alt", "10"),
  InfoData("Time", "00:00:00"),
];

// Item widget
class InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const InfoItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
