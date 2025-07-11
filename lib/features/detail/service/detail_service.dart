// services/product_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/features/home/models/product_model.dart';

class DetailService {
  static Future<ProductModel> getProductById(String id) async {
    final response = await http.get(Uri.parse("https://fakestoreapi.com/products/$id"));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return ProductModel.fromJson(json);
    } else {
      throw Exception('Failed to fetch product');
    }
  }
}
