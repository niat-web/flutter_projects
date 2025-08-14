import 'package:flutter/material.dart';

class GridScreen extends StatelessWidget {
  const GridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "https://i.pinimg.com/736x/21/e1/51/21e1511ec49126f5cab3fa3638164aea.jpg",
      "https://wallpapers.com/images/featured/virat-kohli-yc8dfpcjssp3s4se.jpg",
    ];
    return Scaffold(
      appBar: AppBar(title: Text("Grid Screen")),

      body: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemBuilder: (context, index) {
          return Image.network(items[index]);
        },
      ),
    );
  }
}
