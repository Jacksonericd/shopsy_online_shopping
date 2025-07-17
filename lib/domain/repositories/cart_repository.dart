import 'package:shopsy/domain/entities/product.dart';

abstract class CartRepository {
  Future<List<Product>> getCartItems();
  Future<void> saveCartItems(List<Product> items);
}
