import 'package:flutter/material.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/services/utils.dart';
import 'package:marocbeauty/widgets/new_products_widget.dart';
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
      body: GridView.custom(
        shrinkWrap: true,
        childrenDelegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return NewProductsWidget(
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
          mainAxisSpacing: 40,
          childAspectRatio: size.width / (size.height * .65),
        ),
        // physics: const NeverScrollableScrollPhysics(),
        // crossAxisCount: 2,
        //   crossAxisCount: 3,
        //   // crossAxisSpacing: 10,
        //   crossAxisSpacing: 8,
        //   // mainAxisSpacing: 10,
        //   mainAxisSpacing: 8,
        //   padding: EdgeInsets.zero,
        //   // childAspectRatio: size.width / (size.height / 0.59),
        //   children: List.generate(16, (index) {
        //     return NewProductsWidget(
        //       height: size.height * 0.10,
        //       width: size.height * 0.10,
        //       imgHeight: size.height * 0.12,
        //       imgWidth: size.height * 0.14,
        //     );
        //   }),
        // ),
      ),
    );
  }
}
