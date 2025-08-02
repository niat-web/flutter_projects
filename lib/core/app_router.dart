import 'package:go_router/go_router.dart';
import 'package:gorouter_bottom_bar/auth/login_screen.dart';
import 'package:gorouter_bottom_bar/auth/register_screen.dart';
import 'package:gorouter_bottom_bar/core/bottom_bar.dart';
import 'package:gorouter_bottom_bar/core/splash_screen.dart';
import 'package:gorouter_bottom_bar/screens/article_screen.dart';
import 'package:gorouter_bottom_bar/screens/category_screen.dart';
import 'package:gorouter_bottom_bar/screens/home_screen.dart';
import 'package:gorouter_bottom_bar/screens/profile_screen.dart';

final approuter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: "/", builder: (context, state) => SplashScreen(),),
    GoRoute(path: "/login", builder: (context, state) => LoginScreen()),
    GoRoute(path: "/register", builder: (context, state) => RegisterScreen(),),
    ShellRoute(
      builder: (context, state, child) => BottomBar(child: child,),
      routes: [
        GoRoute(path: "/home", builder: (context, state) => HomeScreen()),
        GoRoute(path: "/article", builder: (context, state) => ArticleScreen()),
        GoRoute(
          path: "/categories",
          builder: (context, state) => CategoryScreen(),
        ),
        GoRoute(path: "/profile", builder: (context, state) => ProfileScreen()),
      ],
    ),
  ],
);
