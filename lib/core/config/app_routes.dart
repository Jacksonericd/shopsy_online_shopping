import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopsy/core/constants/route_constants.dart';
import 'package:shopsy/domain/entities/product.dart';
import 'package:shopsy/presentation/pages/cart_page.dart';
import 'package:shopsy/presentation/pages/product_detail_page.dart';
import 'package:shopsy/presentation/pages/product_list_page.dart';
import 'package:shopsy/presentation/pages/splash_page.dart';

class AppRouter {
  static GoRouter? _appGoRouter;

  static GoRouter? get appGoRouter => _appGoRouter;

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static void initialize() {
    _appGoRouter = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: RouteConstants.splashView.path,
      routes: _appRoutes,
    );
  }

  static final _appRoutes = <RouteBase>[
    GoRoute(
      name: RouteConstants.splashView.name,
      path: RouteConstants.splashView.path,
      builder: (context, state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      name: RouteConstants.productsView.name,
      path: RouteConstants.productsView.path,
      builder: (context, state) {
        return const ProductListPage();
      },
    ),
    GoRoute(
      name: RouteConstants.productDetailView.name,
      path: RouteConstants.productDetailView.path,
      builder: (context, state) {
        final product = state.extra as Product;
        return ProductDetailPage(product: product);
      },
    ),
    GoRoute(
      name: RouteConstants.cartView.name,
      path: RouteConstants.cartView.path,
      builder: (context, state) {
        return const CartPage();
      },
    ),
  ];
}
