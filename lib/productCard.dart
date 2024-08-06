import 'package:flutter/material.dart';
import 'ProductS.dart';


class ProductCard extends StatelessWidget {
  final Product product;
  final Function(Product) onFavoriteToggle;
  final bool isFavorite;

  ProductCard({
    required this.product,
    required this.onFavoriteToggle,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            product.imageAsset,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.all(.0),
            child: Text(product.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('\$${product.price.toStringAsFixed(2)}'),
          ),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: () => onFavoriteToggle(product),
          ),
        ],
      ),
    );
  }
}
