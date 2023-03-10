import 'package:flutter/material.dart';
import 'package:marocbeauty/models/products_model.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/providers/cart_provider.dart';
import 'package:marocbeauty/screens/cart/cart_widget.dart';
import 'package:marocbeauty/screens/empty_screen.dart';
import 'package:marocbeauty/services/utils.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = Utils(context).getScreenSize;
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItemsList =
        cartProvider.getCartItems.values.toList().reversed.toList();

    return Scaffold(
      body: cartItemsList.isEmpty
          ? EmptyScreen(icon: Icons.shopping_cart, title: 'السلة فارغة')
          : Stack(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: cartItemsList.length,
                  itemBuilder: (context, index) => ChangeNotifierProvider.value(
                      value: cartItemsList[index], child: const CartWidget()),
                ),
                CheckOutWidget(size: size, themeState: themeState),
              ],
            ),
    );
  }
}

class CheckOutWidget extends StatelessWidget {
  const CheckOutWidget({
    Key? key,
    required this.size,
    required this.themeState,
  }) : super(key: key);

  final Size size;
  final DarkThemeProvider themeState;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: size.width,
        height: 100,
        color: themeState.getDarkTheme ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '1000 درهم',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'المجموع',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary:
                      themeState.getDarkTheme ? Colors.white : Colors.black,
                  onPrimary:
                      themeState.getDarkTheme ? Colors.black : Colors.white,
                ),
                child: const Text(
                  'اشتري الآن وادفع لاحقًا',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
