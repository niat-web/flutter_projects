import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/features/detail/service/detail_service.dart';
import 'package:shopping_app/features/home/models/product_model.dart';
part 'detail_provider.g.dart';

@riverpod
Future<ProductModel> detailProvider(DetailProviderRef ref, String id) {
  return DetailService.getProductById(id);
}
