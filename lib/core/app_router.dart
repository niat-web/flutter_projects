import 'package:bottom_bar_gorouter/auth/login_screen.dart';
import 'package:bottom_bar_gorouter/auth/register_screen.dart';
import 'package:bottom_bar_gorouter/core/bottom_bar.dart';
import 'package:bottom_bar_gorouter/core/splash_screen.dart';
import 'package:bottom_bar_gorouter/screens/article_screen.dart';
import 'package:bottom_bar_gorouter/screens/home_screen.dart';
import 'package:bottom_bar_gorouter/screens/profile_screen.dart';
import 'package:bottom_bar_gorouter/screens/search_screen.dart';
import 'package:go_router/go_router.dart';

final approuter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: "/", builder: (context, state) => SplashScreen()),
    GoRoute(path: "/login", builder: (context, state) => LoginScreen()),
    GoRoute(path: "/register", builder: (context, state) => RegisterScreen(),),

    ShellRoute(
      builder: (context, state, child) => BottomBar(child: child),
      routes: [
      GoRoute(path: "/home", builder: (context, state) => HomeScreen(),),
      GoRoute(path: "/article", builder: (context, state) => ArticleScreen(),),
      GoRoute(path: "/search", builder: (context, state) => SearchScreen(),),
      GoRoute(path: "/profile", builder: (context, state) => ProfileScreen(),)
    ])
  ],
);
