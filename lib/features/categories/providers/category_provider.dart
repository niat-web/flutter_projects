import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/features/categories/service/category_service.dart';
import 'package:shopping_app/features/home/models/product_model.dart';

part 'category_provider.g.dart';

@riverpod
Future<List<String>> categoryList(CategoryListRef ref) {
  return CategoryService.fetchCategory();
}

@riverpod
Future<List<ProductModel>> categoryProducts(
  CategoryProductsRef ref,
  String category,
) {
  return CategoryService.fetchCategoryByName(category);
}
