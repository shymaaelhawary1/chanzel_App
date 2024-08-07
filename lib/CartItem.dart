import 'package:flutter/material.dart';
import 'ProductS.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartItem({Key? key, required this.product, required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Image.asset(
            product.imageAsset,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text('x$quantity', style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}