import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(Product product) {
    if (_items.containsKey(product.name)) {
      // Increase quantity if product already in cart
      _items.update(
        product.name,
            (existingCartItem) => CartItem(
          product: existingCartItem.product,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      // Add product to cart
      _items.putIfAbsent(
        product.name,
            () => CartItem(
          product: product,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productName) {
    _items.remove(productName);
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }
}
