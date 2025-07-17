import 'package:flutter/material.dart';
import 'package:shopsy/domain/entities/product.dart';

import 'cached_network_image_widget.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.product,
    required this.onRemoveClicked,
  });

  final Product product;
  final VoidCallback onRemoveClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ListTile(
        tileColor: Colors.white,
        leading: CachedNetworkImageWidget(
          imageUrl: product.imageUrl,
          height: 80,
          width: 80,
        ),
        title: Text(
          product.productName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '₹${product.price.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Color(0xFFCE2041),
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Color(0xFFCE2041)),
          onPressed: onRemoveClicked,
        ),
      ),
    );
  }
}
