
import 'package:flutter/material.dart';

import 'detailsPage.dart';

class Product {
  final String imageAsset;
  final String title;
  final double price;
  final String category;

  Product({
    required this.imageAsset,
    required this.title,
    required this.price,
    required this.category,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;
  final Function(Product) onFavoriteToggle;
  final bool isFavorite;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onFavoriteToggle,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Image.asset(
              product.imageAsset,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                      ),
                      onPressed: () => onFavoriteToggle(product),
                    ),
                    IconButton(
                      icon: const Icon(Icons.info),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsWidget(
                              product: product, onColorSelected: (Color ) {  },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

