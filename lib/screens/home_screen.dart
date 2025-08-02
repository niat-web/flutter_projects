import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = "";
  String password = "";

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDetails();
  }


  Future<void> _getDetails() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
        email = prefs.getString("email") ?? "No email found";
      password = prefs.getString("password") ?? "No password found";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Column(
        children: [
          Text("Login Data", style: TextStyle(fontWeight: FontWeight.bold),),
          Text("Email: $email"),
          SizedBox(height: 10),
          Text("Passoword: $password"),
        ],
      ),
    );
  }
}
