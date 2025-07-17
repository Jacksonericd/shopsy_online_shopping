import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import 'cached_network_image_widget.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onClicked;

  const ProductCard({
    super.key,
    required this.product,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
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
  }
}
