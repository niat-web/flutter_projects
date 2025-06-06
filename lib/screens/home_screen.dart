import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        title: Text("Home Screen"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('isLoggedIn');
              context.go('/login');
            },
          ),
        ],
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.push('/details');
          },
          child: Text(
            "Go to Details",
            style: TextStyle(fontSize: 24, fontWeight:FontWeight.bold ),
          ),
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       "Welcome to the Home Screen",
        //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         context.push('/details');
        //       },
        //       child: Container(
        //         width: 300,
        //         height: 200,
        //         child: Image.asset("assets/food_app_image.jpg"),
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
