import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marocbeauty/services/utils.dart';
import 'package:marocbeauty/widgets/price_widget.dart';

class NewProductsWidget extends StatefulWidget {
  double height;
  double width;
  double imgHeight;
  double imgWidth;
  NewProductsWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.imgHeight,
      required this.imgWidth});

  @override
  State<NewProductsWidget> createState() => _NewProductsWidgetState();
}

class _NewProductsWidgetState extends State<NewProductsWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Container(
      height: widget.height,
      width: widget.width,
      child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FancyShimmerImage(
                          imageUrl:
                              'https://cdn.youcan.shop/stores/c749137d893cf429107e4a8c5fd443b6/products/bFyGtp4QUP8hQqPaFEIy8JWcw0BQkuKPEaf8BYWC_lg.png',
                          boxFit: BoxFit.fill,
                          // height: size.height * 0.16,
                          // width: size.height * 0.16,
                          height: widget.imgHeight,
                          width: widget.imgWidth,
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
              PriceWidget(
                price: '200dh',
                oldPrice: '250dh',
                width: widget.imgWidth,
              ),
              // add to cart
              Container(
                height: 27,
                width: widget.imgWidth,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 250, 26, 168),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      CupertinoIcons.cart,
                      color: Colors.white,
                    ),
                    Text(
                      'أضف للسلة',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}