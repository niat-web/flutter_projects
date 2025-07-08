import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/product_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Consumer<ProductProvider>(
        builder: (context, provider, _) {
          final products = provider.products;
          
          if (products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, index) {
              final product = products[index];
              return ListTile(
                leading: Image.network(product.image, width: 40, height: 40),
                title: Text(product.title),
                subtitle: Text('₹${product.price}'),
              );
            },
          );
        },
      ),
    );
  }
}
