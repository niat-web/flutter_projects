import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Future<void> _saveData() async {
    var box = await Hive.openBox("registerBox");
    await box.put("name", nameController.text);
    await box.put("email", emailController.text);
    await box.put("password", passwordController.text);
    await box.put("place", placeController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Screen")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your Name",
                  label: Text("Name"),
                ),
                validator: (value) {
                  if (value!.isEmpty || value == "") {
                    return "Please Enter your name";
                  }
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your Email",
                  label: Text("Email"),
                ),
                validator: (value) {
                  if (value!.isEmpty || value == "") {
                    return "Please Enter your Email";
                  }
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your Password",
                  label: Text("Password"),
                ),
                validator: (value) {
                  if (value!.isEmpty || value == "") {
                    return "Please Enter your password";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: placeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your Place",
                  label: Text("Place"),
                ),
                validator: (value) {
                  if (value!.isEmpty || value == "") {
                    return "Please Enter your Place";
                  }
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Registration Successful")),
                    );
                    _saveData();
                    context.go("/home");
                  }
                },
                child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
