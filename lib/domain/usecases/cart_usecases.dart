import 'package:shopsy/core/service_locator.dart';
import 'package:shopsy/domain/entities/product.dart';
import 'package:shopsy/domain/repositories/cart_repository.dart';

class CartUseCases {
  final repository = sl<CartRepository>();

  Future<List<Product>> getCartItems() => repository.getCartItems();
  Future<void> saveCartItems(List<Product> items) =>
      repository.saveCartItems(items);
}
