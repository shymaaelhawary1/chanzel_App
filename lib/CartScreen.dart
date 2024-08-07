import 'package:chanzel_app/CartItem.dart';
import 'package:chanzel_app/cartManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartManager>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCFABA0),
        title: const Text('Your Cart'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.products.length,
              itemBuilder: (context, index) {
                var product = cart.products[index];
                return CartItem(
                  product: product,
                  quantity: cart.getProductQuantity(product),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${cart.totalPrice}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement checkout functionality
                  },
                  child: const Text('Pay Now'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCFABA0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}