import 'package:bottom_bar_login/screens/article_screen.dart';
import 'package:bottom_bar_login/screens/home_screen.dart';
import 'package:bottom_bar_login/screens/profile_screen.dart';
import 'package:bottom_bar_login/screens/search_screen.dart';
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
    SearchScreen(),
    ProfileScreen(),
  ];

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Article'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
