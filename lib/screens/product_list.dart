import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/providers/product_provider.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productListNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(productListNotifierProvider.notifier).refreshProducts();
              // ref.read(productListNotifierProvider.notifier).refreshProducts();
            },
          ),
        ],
      ),
      body: productAsync.when(
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ListTile(
              leading: Image.network(product.image, height: 50, width: 50),
              title: Text(product.title),
              subtitle: Text("${product.price}"),
              trailing: GestureDetector(
                onTap: () {
                  ref
                      .read(productListNotifierProvider.notifier)
                      .deleteProduct(product.id);
                  // ref
                  //     .read(productListNotifierProvider.notifier)
                  //     .deleteProduct(product.id);
                },
                child: Icon(Icons.delete),
              ),
            );
          },
        ),
        error: (err, stack) => Center(child: Text('Error: $err')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
      //
    );
  }
}
