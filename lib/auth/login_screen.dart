import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  Future<void> _saveDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("email", emailController.text);
    await prefs.setString("password", passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your Email",
                  labelText: "Email",
                ),
                validator: (value) {
                  if (value!.isEmpty || value == "") {
                    return "Please enter your email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your password",
                  labelText: "Password",
                ),
                validator: (value) {
                  if (value!.isEmpty || value == "") {
                    return "Please enter your password";
                  } else if (value.length < 6) {
                    return "Password should be minimum of 6 characters long";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _saveDetails();
                    context.go("/home");
                  }
                },
                child: Text("Submit"),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      context.go("/register");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
