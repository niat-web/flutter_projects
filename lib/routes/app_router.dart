import 'package:go_router/go_router.dart';
import 'package:textformfields/forms.dart';
import 'package:textformfields/screens/article_screen.dart';
import 'package:textformfields/screens/bottom_nav_screen.dart';
import 'package:textformfields/screens/detail_screen.dart';
import 'package:textformfields/screens/home_screen.dart';
import 'package:textformfields/screens/music_screen.dart';
import 'package:textformfields/screens/profile_screen.dart';

final GoRouter appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const FormScreen(),
  ),
  GoRoute(path: '/details', builder: (context, state) => const DetailScreen()),
  ShellRoute(
      builder: (context, state, child) {
        return BottomNavWrapper(child: child);
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
        GoRoute(
          path: '/articles',
          builder: (context, state) => const ArticleScreen(),
        ),
        GoRoute(
            path: '/music', builder: (context, state) => const MusicScreen()),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ])
]);
