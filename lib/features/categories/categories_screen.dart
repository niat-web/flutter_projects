import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/features/categories/providers/category_provider.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryAsync = ref.watch(categoryListProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: categoryAsync.when(
        data: (categories) {
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return ListTile(
                leading: CircleAvatar(child: Text("${index + 1}")),
                title: Text(category),
                onTap: () {
                  context.push("/category-products", extra: category);
                },
              );
            },
          );
        },
        error: (e, _) => Center(child: Text("Error:$e")),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
