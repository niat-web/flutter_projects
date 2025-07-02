import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/auth/login_screen.dart';
import 'features/notes/screens/note_list_screen.dart';
import 'features/notes/screens/note_detail_screen.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: GoRouterRefreshStream(
      Supabase.instance.client.auth.onAuthStateChange,
    ),
    redirect: (context, state) {
      final session = Supabase.instance.client.auth.currentSession;
      final isLoggingIn = state.uri.toString() == '/';

      if (session == null && !isLoggingIn) return '/';
      if (session != null && isLoggingIn) return '/notes';
      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/notes', builder: (_, __) => const NoteListScreen()),
      GoRoute(
        path: '/note/new',
        builder: (_, __) => const NoteDetailScreen(noteId: 'new'),
      ),
      GoRoute(
        path: '/note/:id',
        builder: (_, state) =>
            NoteDetailScreen(noteId: state.pathParameters['id']!),
      ),
    ],
  );
});
