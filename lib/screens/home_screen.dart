import 'package:animation_app/screens/details_screen.dart';
import 'package:animation_app/widgets/animated_progress_bar.dart';
import 'package:animation_app/widgets/list_tile_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation App")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeTransition(
              opacity: _animation,
              child: Hero(tag: "VK", child: Image.asset("assets/VK.jpg")),
            ),
            SizedBox(height: 10),
            ListTileCard(
              title: 'Virat kohli',
              value: '52.2',
              color: Colors.orange,
            ),
            SizedBox(height: 10),
            ListTileCard(title: 'M.S. Dhoni', value: '48', color: Colors.green),
            SizedBox(height: 10),
            ListTileCard(title: 'M.S. Dhoni', value: '48'),
            SizedBox(height: 5,),
            AnimatedProgressBar(progressvalue: 0.4,),
                        AnimatedProgressBar(progressvalue: 0.7),

            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(seconds: 6),
                    pageBuilder: (_,_,_)=> DetailsScreen()),
                );
              },
              child: Text("Click Me"),
            ),
          ],
        ),
      ),
    );
  }
}
