import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/product_model.dart';
import 'dart:convert';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    if (response.statusCode == 200) {
      try {
        List data = jsonDecode(response.body);
        _products = data.map((e) => Product.fromJson(e)).toList();
        print("Products fetched: ${_products.length}");
        notifyListeners();
      } catch (e) {
        print("Error parsing products: $e");
      }
    }
  }
}
