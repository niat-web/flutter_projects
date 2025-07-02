import 'package:flutter/material.dart';
import '../widgets/animated_progress.dart';
import '../widgets/fitness_card.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fitness Dashboard")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeTransition(
              opacity: _opacityAnimation,
              child: Hero(
                tag: 'run',
                child: Image.asset('assets/fitness_image.jpg', height: 150),
              ),
            ),
            SizedBox(height: 20),
            FitnessCard(title: "Steps", value: "4,203", color: Colors.blue),
            FitnessCard(title: "Calories", value: "321", color: Colors.orange),
            SizedBox(height: 30),
            AnimatedProgressBar(percent: 0.65),
            SizedBox(height: 30),
            Text("Loading Workout Plan..."),
            SizedBox(height: 10),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 6.28, // 2π = full rotation
                  child: child,
                );
              },
              child: Icon(Icons.fitness_center, size: 50, color: Colors.green),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(seconds: 4),
                    pageBuilder: (_, __, ___) => DetailsScreen(),
                  ),
                );
              },
              child: Text("View Details"),
            ),
          ],
        ),
      ),
    );
  }
}
