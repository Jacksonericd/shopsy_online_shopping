import 'package:flutter/material.dart';
import 'package:shopsy/core/constants/string_constants.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({super.key, required this.onButtonPressed});
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.shopping_cart, color: Colors.white),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFCE2041),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onPressed: onButtonPressed,
      label: Text(
        StringConstants.addToCart,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: Colors.white),
      ),
    );
  }

}