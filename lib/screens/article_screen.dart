import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
String name = "";
String email = "";
String password = "";
String place = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getRegisteredData();
  }

  Future<void> _getRegisteredData() async {
    var box = await Hive.openBox("registerBox");
    setState(() {
      name = box.get("name", defaultValue: "No name found");
      email = box.get("email", defaultValue: "No email found");
      password = box.get("password", defaultValue: "No Password found");
      place = box.get("place", defaultValue: "No place found");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Article Screen")),
    body: Column(
      children: [
         Text("Register data", style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
           Text("Name: $name"),
           SizedBox(height: 10),
          Text("Email: $email"),
           SizedBox(height: 10),
          Text("Passoword: $password"),
           SizedBox(height: 10),
          Text("Place: $place"),
      ],
    ),
    );
  }
}