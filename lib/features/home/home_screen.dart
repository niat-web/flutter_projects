// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:shopping_app/features/home/models/product_model.dart';
import 'package:shopping_app/features/home/providers/product_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productProviderProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: productAsync.when(
        data: (products) {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(product: product);
            },
          );
        },
        error: (e, _) => Center(child: Text("Error: $e")),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class ProductCard extends ConsumerStatefulWidget {
  final ProductModel product;
  const ProductCard({required this.product});

  @override
  ConsumerState<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends ConsumerState<ProductCard> {
  bool isInCart = false;

  @override
  void initState() {
    super.initState();
    checkIfInCart();
  }

  void checkIfInCart() async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    final result = await Supabase.instance.client
        .from('cart')
        .select()
        .eq('user_id', userId!)
        .eq('product_id', widget.product.id)
        .maybeSingle();

    if (result != null) {
      setState(() => isInCart = true);
    }
  }

  Future<void> toggleCart() async {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser?.id;

    if (userId == null) return;

    if (isInCart) {
      await supabase
          .from("cart")
          .delete()
          .eq("user_id", userId)
          .eq("product_id", widget.product.id);
    } else {
      await supabase.from("cart").insert({
        "user_id": userId,
        "product_id": widget.product.id,
        "title": widget.product.title,
        "description": widget.product.description,
        "image": widget.product.image,
      });
    }

    setState(() {
      isInCart = !isInCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: GestureDetector(
        onTap: () {
          context.push('/detail/${widget.product.id}');
        },
        child: ListTile(
          leading: Image.network(widget.product.image, width: 60),
          title: Text(widget.product.title),
          subtitle: Text(
            widget.product.description.length > 100
                ? "${widget.product.description.substring(0, 100)}..."
                : widget.product.description,
          ),
          trailing: TextButton(
            onPressed: toggleCart,
            child: Text(isInCart ? "Remove from Cart" : "Add to cart"),
          ),
        ),
      ),
    );
  }
}
