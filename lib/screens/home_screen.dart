import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String getEmail = "";
  String getPassword = "";
  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      getEmail = prefs.getString("email")!;
      getPassword = prefs.getString("password")!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Screen", style: TextStyle(color: Colors.black)),
          actions: [
            IconButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                context.go("/article");
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
        body: Column(
          children: [
            Text("email: $getEmail"),
            SizedBox(height: 10),
            Text("password: $getPassword"),
          ],
        ),
      ),
    );
  }
}
