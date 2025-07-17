import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/product.dart';
import '../providers/cart_provider.dart';
import '../widgets/cached_network_image_widget.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(product.productName)),
      body: Column(
        children: [
          CachedNetworkImageWidget(imageUrl: product.imageUrl, height: 200),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.productName, style: const TextStyle(fontSize: 24)),
                Text('₹${product.price}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 16),
                Text(product.description),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    cartProvider.addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to cart')),
                    );
                  },
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
