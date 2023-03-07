import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marocbeauty/models/cart_model.dart';
import 'package:marocbeauty/models/products_model.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/providers/products_provider.dart';
import 'package:marocbeauty/services/global_methods.dart';
import 'package:marocbeauty/services/utils.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int total = 1;
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final cartModel = Provider.of<CartModel>(context);
    Size size = Utils(context).getScreenSize;
    GlobalMethods globalMethods = GlobalMethods();

    final productsProvider = Provider.of<ProductsProvider>(context);
    final getProduct = productsProvider.findProductById(cartModel.productId);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: () => {},
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  // number of products
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FancyShimmerImage(
                        imageUrl: getProduct.imageUrl,
                        boxFit: BoxFit.fill,
                        height: size.height * 0.10,
                        width: size.height * 0.10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getProduct.title,
                          style: TextStyle(
                            color: themeState.getDarkTheme
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'وصف المنتج',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          getProduct.SalePrice.toStringAsFixed(2),
                          style: TextStyle(
                            color: themeState.getDarkTheme
                                ? Colors.grey
                                : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const Spacer(),

                  SizedBox(
                    width: size.width * 0.26,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => {
                            total--,
                            setState(() {
                              total > 0 ? total : total = 1;
                            }),
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: total > 1
                                  ? const Color.fromARGB(255, 251, 90, 208)
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Icon(
                                CupertinoIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          total.toString(),
                          style: TextStyle(
                            color: themeState.getDarkTheme
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () => {
                            setState(() {
                              total++;
                            }),
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 252, 0, 185),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Icon(
                                CupertinoIcons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // detele product

                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () => {
                      GlobalMethods().warningDialog(
                          context: context,
                          title: "حذف المنتج",
                          subtitle: "هل تريد حذف المنتج من السلة؟",
                          function: () => {}),
                    },
                    child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: Center(
                        child: Icon(
                          CupertinoIcons.delete,
                          color: Color.fromARGB(255, 255, 7, 7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
