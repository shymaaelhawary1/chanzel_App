import 'package:chanzel_app/favourite/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ProductS.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isFavorite;

  const ProductCard({
    Key? key,
    required this.product,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favouriteCubit = BlocProvider.of<FavouriteCubit>(context);

    return Card(
      elevation: 4.0,
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
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              if (isFavorite) {
                favouriteCubit.removeFavorite(product);
              } else {
                favouriteCubit.addFavorite(product);
              }
            },
          ),
        ],
      ),
    );
  }
}
