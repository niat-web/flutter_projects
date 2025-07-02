import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app_router.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Supabase.initialize(
//     url: 'https://yguumozvadjxufvjlymt.supabase.co',
//     anonKey:
//         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlndXVtb3p2YWRqeHVmdmpseW10Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEzNTE3NzcsImV4cCI6MjA2NjkyNzc3N30.yOUWho0VQCKxaIR-JXlwaiRGOMp3eesUDJ1d3njNAwM',
//   );
//   final session = Supabase.instance.client.auth.currentSession;
//   final initialRoute = session != null ? '/notes' : '/';
//   runApp(ProviderScope(child: MyApp(initialRoute: initialRoute)));
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://yguumozvadjxufvjlymt.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlndXVtb3p2YWRqeHVmdmpseW10Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEzNTE3NzcsImV4cCI6MjA2NjkyNzc3N30.yOUWho0VQCKxaIR-JXlwaiRGOMp3eesUDJ1d3njNAwM',
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}
