import 'package:flutter/material.dart';
import '../../ProductS.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Product> favoriteProducts;

  FavoritesScreen({required this.favoriteProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.5, 
        ),
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: favoriteProducts[index],
            onFavoriteToggle: (product) {},
            isFavorite: true,
          );
        },
      ),
    );
  }
}


