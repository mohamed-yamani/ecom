import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String id,
      title,
      imageUrl,
      productCategoryName,
      details,
      productCategoryId;
  final double price, salePrice;
  final bool isOnSale, isPiece, isNew, isBestSeller;

  ProductModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.isOnSale,
    required this.isPiece,
    required this.productCategoryName,
    required this.salePrice,
    required this.details,
    required this.productCategoryId,
    required this.isNew,
    required this.isBestSeller,
  });
}
