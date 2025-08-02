import 'dart:convert';

import 'package:project_riverpod/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products/"),
    );
    try{
      if(response.statusCode == 200) {
        final List decoded = json.decode(response.body);
        return decoded.map((json) => ProductModel.fromJson(json)).toList();
      }else{
        print("Error: ${response.statusCode}");
        throw Exception("Failed to load products");
      }
    }catch(e){
      print("Exception: $e");
      throw Exception("Failed to parse products");
    }
  }

  
}
