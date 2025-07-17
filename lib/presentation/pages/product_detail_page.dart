import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsy/core/constants/string_constants.dart';
import '../../domain/entities/product.dart';
import '../providers/cart_provider.dart';
import '../widgets/add_cart_button.dart';
import '../widgets/cached_network_image_widget.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(product.productName)),
      body: Column(
        children: [
          CachedNetworkImageWidget(imageUrl: product.imageUrl, height: 200),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                Text(
                  '₹${product.price}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Color(0xFFCE2041),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  product.description,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: AddCartButton(
                    onButtonPressed: () {
                      cartProvider.addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(StringConstants.addedToCart),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
