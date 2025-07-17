import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ProductUsecases {
  final ProductRepository repository;

  ProductUsecases(this.repository);

  Future<List<Product>> call() async {
    return await repository.getProducts();
  }
}
