import 'package:shopping_app/features/cart/model/cart_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartService {
  static Future<List<CartModel>> fetchCartProducts() async {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser!.id;

    final response = await supabase.from("cart").select().eq("user_id", userId);
    return (response as List).map((item) => CartModel.fromJson(item)).toList();
  }
}
