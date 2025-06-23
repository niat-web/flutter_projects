// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:riverpod_project/models/product_model.dart';
// import 'package:riverpod_project/service/product_service.dart';
// part 'product_provider.g.dart';

// @riverpod
// class ProductListNotifier extends _$ProductListNotifier {
//   @override
//   Future<List<ProductModel>> build() async {
//     return await ProductService.fetchProducts();
//   }

//   // void refreshProducts() async {
//   //   state = const AsyncLoading(); // show loader
//   //   state = await AsyncValue.guard(() async {
//   //     return await  ProductService.fetchProducts();
//   //   });
//   // }

//   // Future<void> deleteProduct(int id) async {
//   //   final current = await future;
//   //   final updated = current.where((p) => p.id != id).toList();
//   //   state = AsyncValue.data(updated);
//   // }
// }

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_project/models/product_model.dart';
import 'package:riverpod_project/service/product_service.dart';

part 'product_provider.g.dart';

@riverpod
class ProductListNotifier extends _$ProductListNotifier {
  @override
  Future<List<ProductModel>> build() async {
    return await ProductService.fetchProducts();
  }

  void refreshProducts() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await ProductService.fetchProducts();
    });
  }

  void deleteProduct(int id) async {
    final current = await future;
    final updated = current.where((p) => p.id != id).toList();
    state = AsyncValue.data(updated);  
    }
}
