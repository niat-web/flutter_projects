import 'dart:convert';

import 'package:project_riverpod/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<ProductModel>> fetchProductsApi() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );

    if (response.statusCode == 200) {
      try {
        final List decoded = json.decode(response.body);
        return decoded.map((each) => ProductModel.fromJson(each)).toList();
      } catch (e) {
        print("error fetching data:$e");
        throw Exception();
      }
    } else {
      print("error in response");
      throw Exception();
    }
  }


  
}
