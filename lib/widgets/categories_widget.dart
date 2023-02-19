import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marocbeauty/screens/all_products_widget.dart';
import 'package:marocbeauty/services/global_methods.dart';

// categoryImage: 'assets/images/category1.png',
//               categoryName: 'منتجات للعناية بالبشرة',
//               color: Color.fromARGB(255, 252, 127, 25),

class CategoriesWidget extends StatelessWidget {
  final String categoryImage;
  final String categoryName;
  final Color color;
  const CategoriesWidget(
      {super.key,
      required this.categoryImage,
      required this.categoryName,
      required this.color});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalMethods globalMethods = GlobalMethods();
    return Container(
      // color: Colors.red,
      child: InkWell(
        onTap: () {
          print('Category Clicked');
          globalMethods.navigateToPage(
              context: context, page: AllProductsWidget.routeName);
        },
        child: Column(
          children: [
            Container(
              height: size.width / 1.57,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: color, width: 1),
              ),
              child: Container(
                height: size.width * 0.3,
                width: size.width,
                decoration: BoxDecoration(
                  // roundedRectangle: BorderRadius.all(Radius.circular(10)),
                  borderRadius: const BorderRadius.all(Radius.circular(9)),
                  image: DecorationImage(
                    image: AssetImage(categoryImage),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Text(categoryName,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
          ],
        ),
      ),
    );
  }
}
