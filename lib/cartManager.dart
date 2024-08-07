import 'package:flutter/material.dart';
import 'ProductS.dart';

class CartManager with ChangeNotifier {
  final List<Product> _products = [];
  final Map<Product, int> _productQuantities = {};

  List<Product> get products => _products;

  void addProduct(Product product) {
    if (_productQuantities.containsKey(product)) {
      _productQuantities[product] = _productQuantities[product]! + 1;
    } else {
      _products.add(product);
      _productQuantities[product] = 1;
    }
    notifyListeners();
  }

  void removeProduct(Product product) {
    if (_productQuantities.containsKey(product) && _productQuantities[product]! > 1) {
      _productQuantities[product] = _productQuantities[product]! - 1;
    } else {
      _products.remove(product);
      _productQuantities.remove(product);
    }
    notifyListeners();
  }

  int getProductQuantity(Product product) {
    return _productQuantities[product] ?? 0;
  }

  double get totalPrice {
    double total = 0.0;
    _productQuantities.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }
}
