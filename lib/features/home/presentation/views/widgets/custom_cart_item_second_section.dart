import 'package:flutter/material.dart';
import 'package:test2_app/features/home/data/models/cart_model/cart_model.dart';

class CustomCartItemSecondSection extends StatelessWidget {
  const CustomCartItemSecondSection({super.key, required this.cartItem});

  final CartModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cartItem.name ?? 'Unnamed Product',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            "${cartItem.price!.toString()} EGP",
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Total: ${(cartItem.quantity!.toDouble() * cartItem.price!).toStringAsFixed(2)} EGP",
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
