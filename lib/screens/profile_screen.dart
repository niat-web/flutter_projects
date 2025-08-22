import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String email = "";
  String password = "";
  Future<void> getData() async {
    var box = await Hive.openBox("RegisterBox");
    setState(() {
      email = box.get("registeremail");
      password = box.get("registerpassword");
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
        actions: [
          IconButton(
            onPressed: () async {
              await Hive.initFlutter();
              await Hive.deleteBoxFromDisk("RegisterBox");
              context.go("/home");
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          Text("email:$email"),
          SizedBox(height: 10),
          Text("password: $password"),
        ],
      ),
    );
  }
}
