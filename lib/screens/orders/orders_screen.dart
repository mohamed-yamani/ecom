import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/screens/orders/orders_widget.dart';
import 'package:marocbeauty/services/global_methods.dart';
import 'package:marocbeauty/services/utils.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders-screen';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = Utils(context).getScreenSize;
    GlobalMethods globalMethods = GlobalMethods();
    return Scaffold(
      body: Stack(
        children: [
          ListView.separated(
              itemCount: 10,
              itemBuilder: ((context, index) {
                return OrdersWidget(size: size, themeState: themeState);
              }),
              separatorBuilder: ((context, index) {
                return Container(
                    height: 14,
                    color: Colors.transparent,
                    child: const Divider(
                      color: Colors.grey,
                      // thickness: 1,
                      endIndent: 30,
                      indent: 30,
                    ));
              })),
          Positioned(
            top: size.height * 0.05,
            right: size.width * 0.05,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Container(
                decoration: BoxDecoration(
                  color: themeState.getDarkTheme
                      ? Colors.grey[900]!.withOpacity(0.5)
                      : Colors.grey[200]!.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.only(right: 9),
                child: Center(
                  child: Icon(Icons.arrow_back_ios,
                      color: themeState.getDarkTheme
                          ? Colors.white
                          : Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
