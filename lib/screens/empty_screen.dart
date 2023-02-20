import 'package:flutter/material.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/screens/all_products_widget.dart';
import 'package:marocbeauty/services/global_methods.dart';
import 'package:provider/provider.dart';

class EmptyScreen extends StatelessWidget {
  IconData icon;
  String title;
  EmptyScreen({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 100,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                GlobalMethods().navigateToPageWithReplacement(
                    context: context, page: AllProductsWidget.routeName);
              },
              style: ElevatedButton.styleFrom(
                primary: themeState.getDarkTheme ? Colors.white : Colors.black,
                onPrimary:
                    themeState.getDarkTheme ? Colors.black : Colors.white,
              ),
              child: const Text(
                'اضف منتجات',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
