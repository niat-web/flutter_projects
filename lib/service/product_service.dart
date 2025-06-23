import 'dart:convert';

import 'package:riverpod_project/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
 static Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );
    if (response.statusCode == 200) {
      try {
        final List decoded = json.decode(response.body);
        return decoded.map((json) => ProductModel.fromJson(json)).toList();
      } catch (e) {
        print("Error parsing products: $e");
        throw Exception("Failed to parse products: $e");
      }
    } else {
      print("Something went wrong");
      throw Exception("Failed to call api");
    }
  }
}
