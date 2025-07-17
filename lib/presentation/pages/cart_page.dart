import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsy/core/constants/string_constants.dart';
import '../providers/cart_provider.dart';
import '../widgets/cached_network_image_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CartProvider>(context, listen: false).loadCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(StringConstants.yourCart)),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, _) {
          if (cartProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final cartItems = cartProvider.items;

          if (cartItems.isEmpty) {
            return Center(child: Text(StringConstants.cartEmpty));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final product = cartItems[index];
                    return ListTile(
                      leading: CachedNetworkImageWidget(
                        imageUrl: product.imageUrl,
                        height: 80,
                        width: 80,
                      ),
                      title: Text(product.productName),
                      subtitle: Text('₹${product.price.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          cartProvider.removeFromCart(product);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total:', style: TextStyle(fontSize: 18)),
                    Text(
                      '₹${cartProvider.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
