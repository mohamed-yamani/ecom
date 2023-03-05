import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String id, title, imageUrl, productCategoryName;
  final double price, SalePrice;
  final bool isOnSale, isPiece;

  ProductModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.isOnSale,
    required this.isPiece,
    required this.productCategoryName,
    required this.SalePrice,
  });
}
