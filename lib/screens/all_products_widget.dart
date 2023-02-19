import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/services/utils.dart';
import 'package:marocbeauty/widgets/products_container_widget.dart';
import 'package:provider/provider.dart';

class AllProductsWidget extends StatelessWidget {
  static const routeName = '/allProducts';
  const AllProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = Utils(context).getScreenSize;
    final color = Utils(context).color;
    return Scaffold(
      body: Stack(
        children: [
          GridView.custom(
            shrinkWrap: true,
            childrenDelegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ProductContainerWidget(
                  height: size.height * 0.10,
                  width: size.height * 0.10,
                  imgHeight: size.height * 0.14,
                  imgWidth: size.height * 0.14,
                );
              },
              childCount: 16,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              // left to right
              // mainAxisExtent: 200,
              mainAxisSpacing: 40,
              childAspectRatio: size.width / (size.height * .65),
            ),
          ),
          Positioned(
            top: size.height * 0.05,
            right: size.width * 0.05,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: themeState.getDarkTheme
                      ? Colors.grey[900]!.withOpacity(0.5)
                      : Colors.grey[200]!.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(CupertinoIcons.xmark,
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
