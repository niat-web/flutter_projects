import 'package:bottom_bar_login/screens/article_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home screen")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ArticleScreen()),
            );
          },
          child: Container(
            child: Image.network(
              "https://media.gettyimages.com/id/1794765882/photo/mumbai-india-virat-kohli-of-india-celebrates-after-scoring-a-century-overtaking-sachin.jpg?s=612x612&w=gi&k=20&c=Z1p_dsw3DQFkIG49fKp5fKKMPXvlJjyiuqhlyv2GPdk=",
            ),
          ),
        ),
      ),
    );
  }
}
