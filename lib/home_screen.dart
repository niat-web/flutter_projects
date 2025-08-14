import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home screen",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to the HOme screen"),
              SizedBox(width: 10),
              Icon(Icons.home, size: 30),
            ],
          ),
          Text("This is a simple example of a home screen in Flutter"),
          SizedBox(height: 20),
          Container(
            height: 100,
            width: 100,
            color: Colors.deepOrange,
            child: Image.asset("assets/profile_image.jpg", fit: BoxFit.fill),
          ),
          SizedBox(height: 20),
          Image.network(
            "https://i.pinimg.com/736x/21/e1/51/21e1511ec49126f5cab3fa3638164aea.jpg",
          ),
        ],
      ),
    );
  }
}
