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

    if (deviceWidth < 768) {
      // return ListView.builder(
      //   itemCount: products.length,
      //   itemBuilder: (_, index) {
      //     final product = products[index];
      //
      //     return GestureDetector(
      //       onTap: () {
      //         sl<NavigationService>().navigateTo(
      //           RouteConstants.productDetailView.path,
      //           arguments: product,
      //         );
      //       },
      //       child: Container(
      //         decoration: BoxDecoration(border: Border.all()),
      //         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //         child: Column(
      //           children: [
      //             CachedNetworkImageWidget(
      //               imageUrl: product.imageUrl,
      //               height: 100,
      //               // width: 100,
      //             ),
      //             Text(
      //               product.productName,
      //               maxLines: 2,
      //               overflow: TextOverflow.ellipsis,
      //             ),
      //             Text('₹${product.price.toStringAsFixed(2)}'),
      //             Divider(),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // );
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

        return GestureDetector(
          onTap: () {
            sl<NavigationService>().navigateTo(
              RouteConstants.productDetailView.path,
              arguments: product,
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Center(
                    child: CachedNetworkImageWidget(
                      imageUrl: product.imageUrl,
                      // height: 100,
                      // width: 100,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  product.productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(height: 5),
                Text(
                  '₹${product.price.toStringAsFixed(2)}',
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
        );

        return ListTile(
          leading: CachedNetworkImageWidget(
            imageUrl: product.imageUrl,
            height: 100,
            width: 100,
          ),
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
