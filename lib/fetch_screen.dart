import 'package:flutter/material.dart';
import 'package:marocbeauty/providers/products_provider.dart';
import 'package:marocbeauty/screens/bottom_bar_screen.dart';
import 'package:provider/provider.dart';

class FetchScreen extends StatefulWidget {
  static const routeName = '/fetch-screen';
  const FetchScreen({super.key});

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(microseconds: 5), () async {
      final productsProvider =
          Provider.of<ProductsProvider>(context, listen: false);
      await productsProvider.fetchProducts();
      Navigator.of(context).pushReplacementNamed(BottomBarScreen.routeName);
    });

    // fetchProducts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
          strokeWidth: 1,
        ),
      ),
    );
  }
}
