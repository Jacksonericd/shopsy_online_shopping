import 'package:flutter/material.dart';
import 'package:shopsy/core/service_locator.dart';
import 'package:shopsy/domain/usecases/cart_usecases.dart';
import '../../domain/entities/product.dart';

class CartProvider with ChangeNotifier {
  final _cartUseCases = sl<CartUseCases>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final List<Product> _items = [];

  List<Product> get items => _items;

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.price);

  Future<void> loadCart() async {
    _isLoading = true;

    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    _items.clear();

    final cartItemsFetched = await _cartUseCases.getCartItems();

    _items.addAll(cartItemsFetched);

    _isLoading = false;

    notifyListeners();
  }

  void addToCart(Product product) {
    _items.add(product);

    _updateCart();

    notifyListeners();
  }

  void removeFromCart(Product product) {
    _items.remove(product);

    _updateCart();

    notifyListeners();
  }

  void _updateCart() {
    _cartUseCases.saveCartItems(items);
  }
}
