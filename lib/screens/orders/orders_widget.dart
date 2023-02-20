import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({
    Key? key,
    required this.size,
    required this.themeState,
  }) : super(key: key);

  final Size size;
  final DarkThemeProvider themeState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                      imageUrl:
                          'https://cdn.youcan.shop/stores/c749137d893cf429107e4a8c5fd443b6/products/bFyGtp4QUP8hQqPaFEIy8JWcw0BQkuKPEaf8BYWC_lg.png',
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
                        'الطلبية رقم 1',
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
                      Text(
                        'تم الشراء في 2021/10/10',
                        style: TextStyle(
                          color: themeState.getDarkTheme
                              ? Colors.white
                              : Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'الحالة: تم الشحن',
                        style: TextStyle(
                          color: themeState.getDarkTheme
                              ? Colors.white
                              : Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  width: 10,
                ),

                // price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'السعر: 1000 درهم',
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
                    Text(
                      'الكمية: 1',
                      style: TextStyle(
                        color: themeState.getDarkTheme
                            ? Colors.white
                            : Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
