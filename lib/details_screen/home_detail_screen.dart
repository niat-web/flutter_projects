import 'package:flutter/material.dart';

class HomeDetailScreen extends StatelessWidget {
  const HomeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Detail Screen")),
      body: Center(child: Text("Welcome to the Home Detail Screen!")),
    );
  }
}
