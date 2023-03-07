import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marocbeauty/consts/constss.dart';
import 'package:marocbeauty/models/products_model.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/providers/products_provider.dart';
import 'package:marocbeauty/services/utils.dart';
import 'package:marocbeauty/widgets/products_container_widget.dart';
import 'package:provider/provider.dart';

class AllProductsWidget extends StatefulWidget {
  static const routeName = '/allProducts';
  const AllProductsWidget({Key? key}) : super(key: key);

  @override
  State<AllProductsWidget> createState() => _AllProductsWidgetState();
}

class _AllProductsWidgetState extends State<AllProductsWidget> {
  List<ProductModel>? allProducts;
  @override
  void initState() {
    super.initState();
  }

  void getProductsList() {
    final productProvider = Provider.of<ProductsProvider>(context);
    final category = ModalRoute.of(context)!.settings.arguments as String;
    if (category.toLowerCase().contains("OnSale".toLowerCase())) {
      allProducts = productProvider.getOnSaleProducts;
    } else {
      allProducts = productProvider.getProductByCategory(category);
    }
    setState(() {
      allProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = Utils(context).getScreenSize;
    getProductsList();

    return Scaffold(
      body: (allProducts != null)
          ? Stack(
              children: [
                GridView.custom(
                  shrinkWrap: true,
                  childrenDelegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return ChangeNotifierProvider.value(
                        value: allProducts![index],
                        child: ProductContainerWidget(
                          height: size.height * 0.10,
                          width: size.height * 0.10,
                          imgHeight: size.height * 0.14,
                          imgWidth: size.height * 0.14,
                        ),
                      );
                    },
                    childCount: allProducts!.length,
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
                if (allProducts!.isEmpty)
                  const Center(
                    child: Text('القائمة فارغة'),
                  ),
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
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
