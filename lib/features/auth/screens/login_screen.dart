import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isPasswordvisible = false;

  void _loginUser() async {
    setState(() {
      isLoading = true;
    });

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final data = response.user;

      if (data != null) {
        final metadata = data.userMetadata ?? {};

        final existing = await Supabase.instance.client
            .from("users")
            .select()
            .eq("id", data.id)
            .maybeSingle();

        if (existing == null) {
          await Supabase.instance.client.from("users").insert({
            "id": data.id,
            "email": data.email,
            "username": metadata["username"],
            "city": metadata["city"],
            "dob": metadata["dob"],
          });
        }
        if (mounted) {
          _showSuccessDialogbox();
        }
        
      }
    } on AuthException catch (e) {
      _showErrorDialogbox(e.message);
    } catch (e) {
      _showErrorDialogbox("Something went wrong");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showSuccessDialogbox() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Login Successful"),
        actions: [
          TextButton(
            onPressed: () => context.go("/home"),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showErrorDialogbox(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
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
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    isPasswordvisible = !isPasswordvisible;
                  }),
                  icon: isPasswordvisible
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
                hintText: "Enter your password",
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: isLoading ? null : _loginUser,
              child: isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Login"),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    context.go("/register");
                  },
                  child: Text("Register", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
