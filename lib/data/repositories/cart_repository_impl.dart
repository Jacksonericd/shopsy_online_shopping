import 'package:shopsy/core/service_locator.dart';
import 'package:shopsy/data/datasources/cart_local_data_source.dart';
import 'package:shopsy/domain/entities/product.dart';
import 'package:shopsy/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final localDataSource = sl<CartLocalDataSource>();

  @override
  Future<List<Product>> getCartItems() {
    return localDataSource.getCartItems();
  }

  @override
  Future<void> saveCartItems(List<Product> items) {
    return localDataSource.saveCartItems(items);
  }
}
