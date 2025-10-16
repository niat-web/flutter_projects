import 'package:flutter/material.dart';
import 'package:flutter_bottom_bar/screens/alarm_screen.dart';
import 'package:flutter_bottom_bar/screens/home_screen.dart';
import 'package:flutter_bottom_bar/screens/profile_screen.dart';
import 'package:flutter_bottom_bar/screens/search_screen.dart';

class FlutterBottomBar extends StatefulWidget {
  const FlutterBottomBar({super.key});

  @override
  State<FlutterBottomBar> createState() => _FlutterBottomBarState();
}

class _FlutterBottomBarState extends State<FlutterBottomBar> {
   int currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [
      HomeScreen(),
      SearchScreen(),
      AlarmScreen(),
      ProfileScreen()
    ];

    void onTap(int index){
      setState(() {
        currentIndex = index;
      });
    }
    return Scaffold(
      body: screens[currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "Alarm"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
      ]) ,
    );
  }
}