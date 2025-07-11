import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/features/cart/provider/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartListProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Cart Screen")),
      body: cartAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return Center(child: Text("Empty Cart Items"));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: () {
                  context.push("/detail/${item.id}");
                },
                child: ListTile(
                  leading: Image.network(item.image),
                  title: Text(item.title),
                  subtitle: Text(
                    item.description.length > 100
                        ? "${item.description.substring(0, 100)}..."
                        : item.description,
                  ),
                ),
              );
            },
          );
        },
        error: (e, _) => Text("Error:$e"),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
