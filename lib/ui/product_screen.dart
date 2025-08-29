import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_riverpod/provider/product_provider.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(fetchProductsDataProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Products Screen")),
      body: productAsync.when(
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final singleProduct = products[index];
            return ListTile(
              leading: Image.network(
                singleProduct.image,
                height: 50,
                width: 50,
              ),
              title: Text(singleProduct.title),
              subtitle: Text(singleProduct.description),
            );
          },
        ),
        error: (err, stack) => Center(child: Text("err:$err")),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
