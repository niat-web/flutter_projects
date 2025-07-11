import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/features/cart/model/cart_model.dart';
import 'package:shopping_app/features/cart/service/cart_service.dart';
part 'cart_provider.g.dart';

@riverpod
Future<List<CartModel>> cartList(CartListRef ref) {
  return CartService.fetchCartProducts();
}
