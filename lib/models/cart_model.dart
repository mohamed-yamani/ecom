import 'package:flutter/material.dart';

class CartModel with ChangeNotifier {
  String id, productId;
  int quantity;
  CartModel(
      {required this.id, required this.productId, required this.quantity});
}
