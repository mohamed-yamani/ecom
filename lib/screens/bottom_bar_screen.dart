import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/screens/cart/cart_screen.dart';
import 'package:marocbeauty/screens/categories_screen.dart';
import 'package:marocbeauty/screens/contact_us.dart';
import 'package:marocbeauty/screens/home_screen.dart';
import 'package:marocbeauty/screens/user_screen.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedPageIndex = 4;
  final List<Map<String, dynamic>> _pages = const [
    {'page': ContactUsScreen(), 'title': 'Contact Us'},
    {'page': UserScreen(), 'title': 'User'},
    {'page': CartScreen(), 'title': 'Cart'},
    {'page': CategoriesScreen(), 'title': 'الفئات'},
    {'page': HomeScreen(), 'title': 'Home'},
  ];

  void _changeSelectedPageIndex(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
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
              icon: Icon(CupertinoIcons.phone_arrow_up_right),
              label: "Contact Us",
            ),
            const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: "User",
            ),
            BottomNavigationBarItem(
              icon: Badge(
                  // toAnimate: false,
                  position: BadgePosition.topEnd(top: -10, end: 16),
                  badgeContent: const Text(
                    '2',
                    style: TextStyle(color: Colors.white),
                  ),
                  badgeStyle: BadgeStyle(
                    badgeColor: Theme.of(context).primaryColor,
                    elevation: 3,
                    // padding: const EdgeInsets.all(1),
                  ),
                  child: const Icon(CupertinoIcons.cart)),
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
