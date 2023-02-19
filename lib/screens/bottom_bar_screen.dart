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
  int _selectedPageIndex = 0;
  final List<Map<String, dynamic>> _pages = const [
    {'page': HomeScreen(), 'title': 'Home'},
    {'page': CategoriesScreen(), 'title': 'الفئات'},
    {'page': CartScreen(), 'title': 'Cart'},
    {'page': UserScreen(), 'title': 'User'},
    {'page': ContactUsScreen(), 'title': 'Contact Us'},
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
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   title: Text(
        //     _pages[_selectedPageIndex]['title'],
        //     style: TextStyle(
        //         color: themeState.getDarkTheme ? Colors.white : Colors.black),
        //     textAlign: TextAlign.center,
        //   ),
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           themeState.setDarkTheme = !themeState.getDarkTheme;
        //         },
        //         icon: Icon(
        //           themeState.getDarkTheme
        //               ? Ionicons.moon_outline
        //               : Ionicons.sunny_outline,
        //           color: themeState.getDarkTheme ? Colors.white : Colors.black,
        //         ))
        //   ],
        // ),

        body: SafeArea(
          child: _pages[_selectedPageIndex]['page'],
        ),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor:
          //     Colors.transparent ? Theme.of(context).cardColor : Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_grid_2x2),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: "User",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone_arrow_up_right),
              label: "Contact Us",
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
