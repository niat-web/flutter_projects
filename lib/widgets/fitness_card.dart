import 'package:flutter/material.dart';

class FitnessCard extends StatefulWidget {
  final String title;
  final String value;
  final Color color;

  const FitnessCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  State<FitnessCard> createState() => _FitnessCardState();
}

class _FitnessCardState extends State<FitnessCard> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.97; // Slightly shrink on tap down
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0; // Restore scale on tap up
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: Duration(milliseconds: 200),
        child: Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListTile(
            leading: Icon(Icons.fitness_center, color: widget.color, size: 30),
            title: Text(widget.title),
            trailing: Text(widget.value, style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
