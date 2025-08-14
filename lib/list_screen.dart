import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("list Screen")),
      body: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
            child: Image.network(
              "https://i.pinimg.com/736x/21/e1/51/21e1511ec49126f5cab3fa3638164aea.jpg",
            ),
          );
        },
      ),
    );
  }
}
