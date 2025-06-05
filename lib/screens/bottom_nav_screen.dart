import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavWrapper extends StatefulWidget {
  final Widget child;

  const BottomNavWrapper({super.key, required this.child});

  @override
  State<BottomNavWrapper> createState() => _BottomNavWrapperState();
}

class _BottomNavWrapperState extends State<BottomNavWrapper> {
  int _currentIndex = 0;

  final tabs = ['/home', '/articles', '/music', '/profile'];

  @override
  Widget build(BuildContext context) {
   final location =
        GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();
    _currentIndex = tabs.indexWhere((path) => location.startsWith(path));
    _currentIndex = _currentIndex == -1 ? 0 : _currentIndex;

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => context.go(tabs[index]),
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Articles'),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Music'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
