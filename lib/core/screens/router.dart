import 'package:go_router/go_router.dart';
import 'package:shopping_app/core/screens/bottom_bar.dart';
import 'package:shopping_app/core/screens/splash_screen.dart';
import 'package:shopping_app/features/auth/screens/login_screen.dart';
import 'package:shopping_app/features/auth/screens/register_screens.dart';
import 'package:shopping_app/features/cart/cart_screen.dart';
import 'package:shopping_app/features/categories/categories_screen.dart';
import 'package:shopping_app/features/categories/catgeory_products_screen.dart';
import 'package:shopping_app/features/detail/detail_screen.dart';
import 'package:shopping_app/features/home/home_screen.dart';
import 'package:shopping_app/features/profile/profile_screen.dart';

final approuter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: "/", builder: (context, state) => SplashScreen()),
    GoRoute(path: "/login", builder: (context, state) => LoginScreen()),
    GoRoute(path: "/register", builder: (context, state) => RegisterScreen()),

    GoRoute(
      path: "/category-products",
      builder: (context, state) => CategoryProductsScreen(),
    ),

    GoRoute(
      path: '/detail/:id',
      name: 'detail',
      builder: (context, state) {
        final productId = state.pathParameters['id']!;
        return DetailScreen(productId: productId);
      },
    ),

    ShellRoute(
      builder: (context, state, child) => BottomBar(child: child),
      routes: [
        GoRoute(path: "/home", builder: (context, state) => HomeScreen()),
        GoRoute(
          path: "/categories",
          builder: (context, state) => CategoriesScreen(),
        ),
        GoRoute(path: "/cart", builder: (context, state) => CartScreen()),
        GoRoute(path: "/profile", builder: (context, state) => ProfileScreen()),
      ],
    ),
  ],
);
