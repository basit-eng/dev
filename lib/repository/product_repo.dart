import 'dart:convert';

import 'package:flutter_api/model/products_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  final baseUrl = "https://fakestoreapi.com/products";
  Future<List<ProductsModel>> getProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsondecode = jsonDecode(response.body) as List;
      print(jsondecode);
      return jsondecode.map((e) {
        print(e['id'].toString());
        return ProductsModel(
          id: e['id'] as int,
          title: e['title'] as String,
          price: e['price'] as num,
          description: e['description'] as String,
          // category: e['category'] as Category,
          image: e['image'] as String,
          // rating: e['rating'] as Rating,
        );
      }).toList();
    } else {
      print("Request Failed");
    }
    return [];
  }
}
