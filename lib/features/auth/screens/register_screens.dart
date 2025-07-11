import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool isPasswordvisible = false;
  bool isLoading = false;
  DateTime? dob;

  Future<void> _registerUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();
    final username = usernameController.text.trim();
    final city = cityController.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        username.isEmpty ||
        city.isEmpty) {
      showErrorDialog("PLease fill all the fields");
      return;
    }

    if (password != confirmPassword) {
      showErrorDialog("Password and confirm password do not match");
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final authres = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {
          "username": username,
          "city": city,
          "dob": dob!.toIso8601String(),
        },
      );

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Regsistration Successful"),
          content: Text(
            "Your account has been created successfully!, please check your email for verification.",
          ),
          actions: [
            TextButton(
              onPressed: () { 
                context.go("/login");
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } catch (e) {
      showErrorDialog("Something went wrong!");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
      initialDate: DateTime(2000),
    );
    if (picked != null) {
      setState(() {
        dob = picked;
      });
    }
  }

  showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Screen")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
                hintText: "Enter your Username",
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                hintText: "Enter your Email",
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: passwordController,
              obscureText: !isPasswordvisible,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                hintText: "Enter your Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordvisible = !isPasswordvisible;
                    });
                  },
                  icon: isPasswordvisible
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                border: OutlineInputBorder(),
                hintText: "Confrim your Password",
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: "City",
                border: OutlineInputBorder(),
                hintText: "Enter your City",
              ),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: _pickDate,
              child: InputDecorator(
                decoration: InputDecoration(labelText: "Date of Birth"),
                child: Text(
                  dob != null
                      ? "${dob!.day}/${dob!.month}/${dob!.year}"
                      : "Select Date of Birth",
                ),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: isLoading ? null : _registerUser,
              child: isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
