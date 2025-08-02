import 'package:project_riverpod/model/product_model.dart';
import 'package:project_riverpod/service/product_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'product_provider.g.dart';

@riverpod
Future<List<ProductModel>> fetchProductsProvider(
  FetchProductsProviderRef ref,
) async {
  return await ProductApi().fetchProducts();
}