import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/features/detail/provider/detail_provider.dart';
import 'package:shopping_app/features/home/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class DetailScreen extends ConsumerStatefulWidget {
  final String productId;
  const DetailScreen({super.key, required this.productId});

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  bool isInCart = false;

  @override
  void initState() {
    super.initState();
    checkIfInCart(widget.productId);
  }

  Future<void> checkIfInCart(String productId) async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    final result = await Supabase.instance.client
        .from('cart')
        .select()
        .eq('user_id', userId!)
        .eq('product_id', productId)
        .maybeSingle();

    if (result != null) {
      setState(() => isInCart = true);
    }
  }

  Future<void> toggleCart(ProductModel product) async {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser?.id;

    if (userId == null) return;

    if (isInCart) {
      await supabase
          .from("cart")
          .delete()
          .eq("user_id", userId)
          .eq("product_id", product.id);
    } else {
      await supabase.from("cart").insert({
        "user_id": userId,
        "product_id": product.id,
        "title": product.title,
        "description": product.description,
        "image": product.image,
      });
    }

    setState(() {
      isInCart = !isInCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(detailProviderProvider(widget.productId));

    return  productAsync.when(
        loading: () =>  Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
        data: (product) {
          return Scaffold(
      appBar: AppBar(title: Text(product.title)),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.network(product.image, height: 200)),
                  const SizedBox(height: 16),
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(product.description, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => toggleCart(product),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isInCart ? Colors.red : Colors.green,
                      ),
                      child: Text(isInCart ? 'Remove from Cart' : 'Add to Cart'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
  }
}
