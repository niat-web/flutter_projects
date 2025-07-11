import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app/features/home/models/product_model.dart';

class CategoryService {
  static Future<List<String>> fetchCategory() async {
    final result = await http.get(
      Uri.parse("https://fakestoreapi.com/products/categories"),
    );
    try {
      if (result.statusCode == 200) {
        return List<String>.from(jsonDecode(result.body));
      } else {
        throw Exception("Unable to fetch categories");
      }
    } catch (e) {
      throw Exception("error:$e");
    }
  }

  static Future<List<ProductModel>> fetchCategoryByName(String category) async {
    final res = await http.get(
      Uri.parse("https://fakestoreapi.com/products/category/$category"),
    );
    try {
      if (res.statusCode == 200) {
        final List data = jsonDecode(res.body);
        return data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw Exception("Unable to fetch categories Item");
      }
    } catch (e) {
      throw Exception("error:$e");
    }
  }
}
