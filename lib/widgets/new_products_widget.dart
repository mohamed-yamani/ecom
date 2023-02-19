import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:marocbeauty/services/utils.dart';

class NewProductsWidget extends StatefulWidget {
  const NewProductsWidget({super.key});

  @override
  State<NewProductsWidget> createState() => _NewProductsWidgetState();
}

class _NewProductsWidgetState extends State<NewProductsWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Container(
      height: size.height * 0.21,
      width: size.height * 0.183,
      child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          // child: Image.network(
                          //   'https://cdn.youcan.shop/stores/c749137d893cf429107e4a8c5fd443b6/products/bFyGtp4QUP8hQqPaFEIy8JWcw0BQkuKPEaf8BYWC_lg.png',
                          //   height: size.height * 0.16,
                          //   // width: size.height * 0.16,
                          //   fit: BoxFit.fill,
                          // ),
                          child: FancyShimmerImage(
                            imageUrl:
                                'https://cdn.youcan.shop/stores/c749137d893cf429107e4a8c5fd443b6/products/bFyGtp4QUP8hQqPaFEIy8JWcw0BQkuKPEaf8BYWC_lg.png',
                            boxFit: BoxFit.fill,
                            height: size.height * 0.16,
                            width: size.height * 0.16,
                          ),
                        ),
                        // 
                        Positioned(
                          top: 3,
                          left: 3,
                          child: Container(
                            height: 18,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                '-20%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 3,
                          right: 3,
                          child: Container(
                            height: 18,
                            // width: 30,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  'cc cream',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      '137 DH',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '179 DH',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
