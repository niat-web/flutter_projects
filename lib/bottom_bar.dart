import 'package:bottom_bar_app/screens/article_screen.dart';
import 'package:bottom_bar_app/screens/home_screen.dart';
import 'package:bottom_bar_app/screens/login_screen.dart';
import 'package:bottom_bar_app/screens/maps_screen.dart';
import 'package:bottom_bar_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    ArticleScreen(),
    ProfileScreen(),
    LoginScreen(),
    MapsScreen()
  ];

  void onTapped(int index) {
    print("screens_length:${screens.length}");
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "Article"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: "login"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Maps")
        ],
      ),
    );
  }
}
