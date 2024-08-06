import 'package:flutter/material.dart';
import 'ProductS.dart';


class CategoryScreen extends StatelessWidget {
  final String category;
  final List<Product> products;
  final List<Product> favoriteProducts;
  final Function(Product) onFavoriteToggle;

  CategoryScreen({
    required this.category,
    required this.products,
    required this.favoriteProducts,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = products.where((product) => product.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category[0].toUpperCase() + category.substring(1)),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.5,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: filteredProducts[index],
            onFavoriteToggle: onFavoriteToggle,
            isFavorite: favoriteProducts.contains(filteredProducts[index]),
          );
        },
      ),
    );
  }
}
