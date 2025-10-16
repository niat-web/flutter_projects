import 'package:flutter/material.dart';
import 'package:flutter_bottom_bar/details_screen/home_detail_screen.dart';
import 'package:flutter_bottom_bar/details_screen/notification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => NotificationScreen()),
              // );
            },
            icon: Icon(Icons.notification_important),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(child: Text("Welcome to the Home Screen!")),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeDetailScreen()),
              );
            },
            child: Image.network(
              "https://cdn.britannica.com/48/252748-050-C514EFDB/Virat-Kohli-India-celebrates-50th-century-Cricket-November-15-2023.jpg",
            ),
          ),
        ],
      ),
    );
  }
}
