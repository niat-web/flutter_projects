import 'dart:convert';

import 'package:shopping_app/features/home/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<ProductModel>> fetchProducts() async {
    final res = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    try {
      if (res.statusCode == 200) {
        List data = jsonDecode(res.body);
        return data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception("Error fetching products: $e");
    }
  }
}
