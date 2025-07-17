import 'package:flutter/material.dart';
import 'package:shopsy/core/service_locator.dart';
import 'package:shopsy/domain/usecases/product_usecases.dart';
import '../../domain/entities/product.dart';

class ProductProvider with ChangeNotifier {
  bool _isLoading = false;

  String? _errorMessage;

  List<Product> _products = [];

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  List<Product> get products => _products;

  Future<void> loadProducts() async {
    try {
      _isLoading = true;

      _errorMessage = null;

      notifyListeners();

      await Future.delayed(const Duration(seconds: 1));

      final getProducts = sl<ProductUsecases>();

      _products = await getProducts();
    } catch (e) {
      _errorMessage = 'Failed to load products: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
