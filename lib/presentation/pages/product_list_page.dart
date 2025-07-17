import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsy/core/constants/route_constants.dart';
import 'package:shopsy/core/constants/string_constants.dart';
import 'package:shopsy/core/service_locator.dart';
import 'package:shopsy/domain/services/navigation_service.dart';
import '../providers/product_provider.dart';
import '../widgets/cached_network_image_widget.dart';
import 'cart_page.dart';
import 'product_detail_page.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductProvider()..loadProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringConstants.appName),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                sl<NavigationService>().navigateTo(
                  RouteConstants.cartView.path,
                );
              },
            ),
          ],
        ),
        body: const _ProductListPage(),
      ),
    );
  }
}

class _ProductListPage extends StatelessWidget {
  const _ProductListPage();

  @override
  Widget build(BuildContext context) {
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

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (_, index) {
        final product = products[index];

        return ListTile(
          leading: CachedNetworkImageWidget(imageUrl: product.imageUrl, height: 100, width: 100),
          title: Text(product.productName),
          subtitle: Text('₹${product.price.toStringAsFixed(2)}'),
          onTap: () {
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
