import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product_model.dart';

class ProductLocalDataSource {
  Future<List<ProductModel>> loadProductsFromJson() async {
    final data = await rootBundle.loadString('assets/products.json');
    final List<dynamic> jsonList = json.decode(data);
    final productList = jsonList.map((json) => ProductModel.fromJson(json)).toList();
    return productList;
  }
}
