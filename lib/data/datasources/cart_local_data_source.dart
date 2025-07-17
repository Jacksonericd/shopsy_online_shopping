import 'dart:convert';

import 'package:shopsy/core/service_locator.dart';
import 'package:shopsy/data/models/product_model.dart';
import 'package:shopsy/domain/entities/product.dart';
import 'package:shopsy/domain/services/preference_service.dart';

class CartLocalDataSource {
  final prefs = sl<PreferenceService>();

  static const String _cartKey = 'cart_items';

  Future<List<Product>> getCartItems() async {
    final jsonString = await prefs.getString(_cartKey);
    if (jsonString == null) return [];

    final jsonList = jsonDecode(jsonString) as List;
    return jsonList.map((e) => ProductModel.fromJson(e).toEntity()).toList();
  }

  Future<void> saveCartItems(List<Product> items) async {
    final jsonList = items
        .map((product) => ProductModel.fromEntity(product).toJson())
        .toList();
    await prefs.setString(_cartKey, jsonEncode(jsonList));
  }
}
