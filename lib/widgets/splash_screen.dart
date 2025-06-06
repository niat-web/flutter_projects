// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     checkLoginStatus();
//   }

//   Future<void> checkLoginStatus() async {
//     await Future.delayed(const Duration(seconds: 2)); // splash delay
//     final prefs = await SharedPreferences.getInstance();
//     final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

//     if (isLoggedIn) {
//       context.go('/home');
//     } else {
//       context.go('/login');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: HexColor("#dfe3f8"),
//       body: Center(
//         child: Image.asset(
//           "assets/splash_screen.webp",
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    // final prefs = await SharedPreferences.getInstance();
    // final isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    final box = await Hive.openBox('authBox');
    final isLoggedIn = box.get("isLogggedIn", defaultValue: false);
    if (isLoggedIn) {
      context.go('/home');
    } else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDDE3F8),
      body: Center(
        child: Image.asset("assets/splash_screen.webp"),
      ),
    );
  }
}
