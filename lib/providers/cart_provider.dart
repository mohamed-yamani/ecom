import 'package:flutter/material.dart';
import 'package:marocbeauty/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _cartItems = {};

  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

  void addProductToCart({required String productId, required int quantity}) {
    _cartItems.putIfAbsent(
        productId,
        () => CartModel(
            id: DateTime.now().toString(),
            productId: productId,
            quantity: quantity));
    notifyListeners();
  }

  void reduceQuantityByOne(String productId) {
    _cartItems.update(
        productId,
        (value) => CartModel(
            id: value.id,
            productId: productId,
            quantity: value.quantity > 1 ? --value.quantity : value.quantity));
    notifyListeners();
  }

  void increaseQuantityByOne(String productId) {
    _cartItems.update(
        productId,
        (value) => CartModel(
            id: value.id, productId: productId, quantity: ++value.quantity));
    notifyListeners();
  }

  void removeItemFromCart(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
