import 'package:flutter/cupertino.dart';

import 'ProductS.dart';

class CartManager extends ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    return _cart.fold(0.0, (total, product) => total + product.price);
  }
}