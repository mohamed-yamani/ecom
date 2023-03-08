import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marocbeauty/consts/firebase_consts.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/providers/cart_provider.dart';
import 'package:marocbeauty/providers/products_provider.dart';
import 'package:marocbeauty/screens/auth/login.dart';
import 'package:marocbeauty/services/global_methods.dart';
import 'package:marocbeauty/services/utils.dart';
import 'package:marocbeauty/widgets/title_widget.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product-details';
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final productProviders = Provider.of<ProductsProvider>(context);
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = Utils(context).getScreenSize;
    GlobalMethods globalMethods = GlobalMethods();
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProviders.findProductById(productId);
    final cartProvider = Provider.of<CartProvider>(context);
    bool isInCart = cartProvider.getCartItems.containsKey(productId);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FancyShimmerImage(
                  imageUrl: getCurrentProduct.imageUrl,
                  boxFit: BoxFit.fill,
                  height: size.width,
                  width: size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // const SizedBox(height: 10),
                        Flexible(
                            child: TitleWidget(title: getCurrentProduct.title)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (getCurrentProduct.price >
                                getCurrentProduct.SalePrice)
                              Text(
                                getCurrentProduct.price.toStringAsFixed(2),
                                style: themeState.getDarkTheme
                                    ? const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.bold)
                                    : const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.bold),
                              ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${getCurrentProduct.SalePrice.toStringAsFixed(2)} درهم",
                              style: themeState.getDarkTheme
                                  ? TextStyle(
                                      color: (getCurrentProduct.price >
                                              getCurrentProduct.SalePrice)
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)
                                  : TextStyle(
                                      color: (getCurrentProduct.price >
                                              getCurrentProduct.SalePrice)
                                          ? Theme.of(context).primaryColor
                                          : Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      getCurrentProduct.details,
                      style: themeState.getDarkTheme
                          ? const TextStyle(color: Colors.white, fontSize: 15)
                          : const TextStyle(color: Colors.black, fontSize: 15),
                      // textDirection: TextDirection.rtl,
                      // textAlign: TextAlign.right,
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
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
                      'التوصيل بالمجان',
                      style: TextStyle(
                        color: Color.fromARGB(255, 252, 8, 195),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        final User? user = authInstance.currentUser;
                        if (user == null) {
                          GlobalMethods().warningDialog(
                              title: 'تنبيه',
                              context: context,
                              subtitle:
                                  'يجب تسجيل الدخول أولا لإضافة المنتجات إلى السلة',
                              function: () {
                                Navigator.pop(context);
                                print('login');
                                Navigator.pushNamed(
                                    context, LoginScreen.routeName);
                              });
                          return;
                        }

                        cartProvider.addProductToCart(
                            productId: productId, quantity: 1);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: themeState.getDarkTheme
                            ? Colors.white
                            : Colors.black,
                        onPrimary: themeState.getDarkTheme
                            ? Colors.black
                            : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            isInCart ? 'في السلة' : 'أضف للسلة',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            CupertinoIcons.cart_badge_plus,
                            size: 25,
                            color: Color.fromARGB(255, 252, 8, 195),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
