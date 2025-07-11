import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/features/home/models/product_model.dart';
import 'package:shopping_app/features/home/service/product_service.dart';
part 'product_provider.g.dart';

@riverpod
Future<List<ProductModel>> ProductProvider(ProductProviderRef ref) {
  return ProductService().fetchProducts();
}
