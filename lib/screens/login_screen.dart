import 'package:flutter/material.dart';
import 'package:sqflite_flutter/models/user_model.dart';
import 'package:sqflite_flutter/screens/home_screen.dart';
import 'package:sqflite_flutter/service/user_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void _saveUser() async {
    final email = emailController.text;
    final password = passwordController.text;
    final username = usernameController.text;

    if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
      final user = UserModel(
        email: email,
        password: password,
        username: username,
      );
      await UserService().insertUser(user);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill all details")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Column(
        children: [
          TextFormField(
            controller: usernameController,

            decoration: InputDecoration(
              labelText: "Username",
              hintText: "Enter your Username",
            ),
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your Email",
            ),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(onPressed : _saveUser, child:  Text("Submit")),
        ],
      ),
    );
  }
}