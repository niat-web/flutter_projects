import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/core/screens/router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    // url: "https://mjwlgpobajbjgopqnyri.supabase.co",
    url: "https://izubtrltweaqvmzuqdva.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml6dWJ0cmx0d2VhcXZtenVxZHZhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE1NTM1MzksImV4cCI6MjA2NzEyOTUzOX0.dYBfHtHd78YoWvh8CzkqvgLDiClPTzNFhLnEFH_u7oU",
        // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1qd2xncG9iYWpiamdvcHFueXJpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE2MDg1NTAsImV4cCI6MjA2NzE4NDU1MH0.90cnaeK_SHt5-F7j3NP19C1nzRAuzKT2pCJZidpXk8A",
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: approuter,
      debugShowCheckedModeBanner: false,
    );
  }
}