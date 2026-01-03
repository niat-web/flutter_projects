import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'presentation/screens/user_selection_screen.dart';
import 'core/local/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await HiveService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserSelectionScreen(),
    );
  }
}
