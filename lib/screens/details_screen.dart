import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Workout Details")),
      body: Center(
        child: Hero(
          tag: 'run',
          child: Image.asset('assets/fitness_image.jpg', height: 250),
        ),
      ),
    );
  }
}