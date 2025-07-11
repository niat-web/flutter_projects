import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/features/categories/providers/category_provider.dart';
import 'package:shopping_app/features/home/home_screen.dart';

class CategoryProductsScreen extends ConsumerWidget {
  const CategoryProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = GoRouterState.of(context).extra as String;
    final productsAsync = ref.watch(categoryProductsProvider(category));
    print("category:$category");
    return Scaffold(
      appBar: AppBar(title: Text("$category")),
      body: productsAsync.when(
        data: (categories) {
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final p = categories[index];

              return ProductCard(product: p);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
