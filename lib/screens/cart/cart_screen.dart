import 'package:flutter/material.dart';
import 'package:marocbeauty/screens/cart/cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 3,
          itemBuilder: (context, index) => const CartWidget()),
    );
  }
}
