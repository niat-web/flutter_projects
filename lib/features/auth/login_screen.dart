import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await Supabase.instance.client.auth.signInWithOtp
                (
                  email: emailController.text,
                  emailRedirectTo:
                      'notesapp://notes', 
                );
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Check Email'),
                    content: const Text(
                      'We have sent a magic login link to your email. Please click it to complete login.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Send Login Link'),
            ),
          ],
        ),
      ),
    );
  }
}
