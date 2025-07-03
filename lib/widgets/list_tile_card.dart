import 'package:flutter/material.dart';

class ListTileCard extends StatefulWidget {
  final String title;
  final String value;
  final Color color;
  const ListTileCard({
    super.key,
    required this.title,
    required this.value,
    this.color = Colors.white,
  });

  @override
  State<ListTileCard> createState() => _ListTileCardState();
}

class _ListTileCardState extends State<ListTileCard> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.7;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: AnimatedScale(
        scale: _scale,
        duration: Duration(seconds: 1),
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: Icon(Icons.fitness_center, color: widget.color),
            title: Text(widget.title, style: TextStyle(fontSize: 18)),
            trailing: Text(widget.value, style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
