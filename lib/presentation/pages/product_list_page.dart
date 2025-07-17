import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsy/core/constants/route_constants.dart';
import 'package:shopsy/core/constants/string_constants.dart';
import 'package:shopsy/core/service_locator.dart';
import 'package:shopsy/domain/services/navigation_service.dart';
import 'package:shopsy/presentation/widgets/product_card.dart';
import '../providers/product_provider.dart';
import '../widgets/cached_network_image_widget.dart';
import 'cart_page.dart';
import 'product_detail_page.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  Widget get appLogo => Image.asset('assets/images/shopsy.png');

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductProvider()..loadProducts(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFCE2041),
          child: const Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: () {
            sl<NavigationService>().navigateTo(RouteConstants.cartView.path);
          },
        ),
        appBar: AppBar(
          leading: appLogo,
          leadingWidth: 100,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Click. Shop. Smile',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.teal[800],
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: const _ProductListPage(),
          ),
        ),
      ),
    );
  }
}

class _ProductListPage extends StatelessWidget {
  const _ProductListPage();

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final provider = context.watch<ProductProvider>();

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.errorMessage != null) {
      return Center(
        child: Text(
          provider.errorMessage!,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    final products = provider.products;

    if (deviceWidth > 768) {
      return ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) {
          final product = products[index];

          return ProductCard(
            product: product,
            onClicked: () {
              sl<NavigationService>().navigateTo(
                RouteConstants.productDetailView.path,
                arguments: product,
              );
            },
          );
        },
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (_, index) {
        final product = products[index];

        return ProductCard(
          product: product,
          onClicked: () {
            sl<NavigationService>().navigateTo(
              RouteConstants.productDetailView.path,
              arguments: product,
            );
          },
        );
      },
    );
  }
}
