import 'package:shopsy/data/models/routes.dart';

class RouteConstants {
  static final splashView = RouteConfig(name: 'splash', path: '/');
  static final cartView = RouteConfig(name: 'cart', path: '/cart');
  static final productsView = RouteConfig(name: 'products', path: '/products');
  static final productDetailView = RouteConfig(
    name: 'product_detail',
    path: '/product_detail',
  );
}
