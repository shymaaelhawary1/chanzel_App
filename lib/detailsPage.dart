import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CartScreen.dart';
import 'ProductS.dart';
import 'available_sized.dart';
import 'cartManager.dart';
import 'colorChosen.dart';

class DetailsWidget extends StatelessWidget {
  final Product product;
  final Function(Color) onColorSelected;

  DetailsWidget({required this.product, required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCFABA0),
        title: const Text("Product Details"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Flexible(
              child: Center(
                child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset(product.imageAsset),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              height: 350,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.favorite_border),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text("Size",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      AvailableSize(size: "S"),
                      AvailableSize(size: "M"),
                      AvailableSize(size: "L"),
                      AvailableSize(size: "XL"),
                      AvailableSize(size: "XXL"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text("Color",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ColorSelectionWidget(
                    selectedColor: Colors.brown,
                    onColorSelected: onColorSelected,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {
                            Provider.of<CartManager>(context, listen: false)
                                .addProduct(product);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartScreen()),
                            );
                          },
                          icon: const Icon(Icons.send),
                          label: const Text("Add to cart")),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
