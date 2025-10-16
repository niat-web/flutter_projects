import 'package:flutter/material.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alarm Screen")),
      body: Center(child: Text("Welcome to the Alarm Screen!")),
    );
  }
}
