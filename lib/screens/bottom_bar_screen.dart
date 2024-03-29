import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/providers/cart_provider.dart';
import 'package:marocbeauty/providers/products_provider.dart';
import 'package:marocbeauty/screens/cart/cart_screen.dart';
import 'package:marocbeauty/screens/categories_screen.dart';
import 'package:marocbeauty/screens/contact_us.dart';
import 'package:marocbeauty/screens/home_screen.dart';
import 'package:marocbeauty/screens/user_screen.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/bottom-bar-screen';
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final List<Map<String, dynamic>> _pages = const [
    {'page': ContactUsScreen(), 'title': 'Contact Us'},
    // {'page': UserScreen(), 'title': 'User'},
    {'page': CartScreen(), 'title': 'Cart'},
    {'page': CategoriesScreen(), 'title': 'الفئات'},
    {'page': HomeScreen(), 'title': 'Home'},
  ];
  late int _selectedPageIndex;

  @override
  void initState() {
    super.initState();
    final productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    productsProvider.fetchProducts();
    _selectedPageIndex =
        _pages.indexWhere((element) => element['title'] == 'Home');
    // fetchProducts
  }

  void _changeSelectedPageIndex(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
        body: SafeArea(
          child: _pages[_selectedPageIndex]['page'],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.whatsapp),
              label: "Contact Us",
            ),
            // const BottomNavigationBarItem(
            //   icon: Icon(CupertinoIcons.person),
            //   label: "User",
            // ),
            BottomNavigationBarItem(
              icon: IconBadge(
                // badgeStyle:
                //     BadgeStyle(badgeColor: Theme.of(context).primaryColor),
                // showBadge: cartProvider.getCartItems.isNotEmpty,
                // badgeContent: FittedBox(
                //   child: Text(
                //     cartProvider.getCartItems.length.toString(),
                //     style: const TextStyle(color: Colors.white),
                //   ),
                // ),
                itemCount: cartProvider.getCartItems.length,
                badgeColor: Theme.of(context).primaryColor,
                right: 0,
                top: 0,
                hideZero: true,
                icon: const Icon(CupertinoIcons.cart),
              ),
              label: "Cart",
            ),
            const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_grid_2x2),
              label: "Categories",
            ),
            const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
          ],
          onTap: _changeSelectedPageIndex,
          currentIndex: _selectedPageIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          // iconSize: 25,
        ));
  }
}
