import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/screens/all_products_widget.dart';
import 'package:marocbeauty/services/global_methods.dart';
import 'package:marocbeauty/services/utils.dart';
import 'package:marocbeauty/widgets/products_container_widget.dart';
import 'package:marocbeauty/widgets/title_widget.dart';
import 'package:provider/provider.dart';

List images = [
  'assets/images/slider1.png',
  'assets/images/slider2.png',
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // "https://picsum.photos/id/$index/500/800",

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = Utils(context).getScreenSize;
    GlobalMethods globalMethods = GlobalMethods();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.25,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: images.length,
                pagination: const SwiperPagination(),
                // control: const SwiperControl(),
                autoplay: true,
                autoplayDelay: 7000,
                autoplayDisableOnInteraction: true,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextButton(
                        onPressed: () {
                          globalMethods.navigateToPage(
                              context: context,
                              page: AllProductsWidget.routeName);
                        },
                        child: Text(
                          "عرض الكل",
                          style: TextStyle(
                            color: themeState.getDarkTheme == true
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TitleWidget(
                        title: "العروض",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.23,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: ScrollController(initialScrollOffset: 90000),
                    // rtl
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: 22,
                    itemBuilder: (context, index) {
                      return ProductContainerWidget(
                        height: size.height * 0.21,
                        width: size.height * 0.193,
                        imgHeight: size.height * 0.16,
                        imgWidth: size.height * 0.16,
                      );
                    },
                  ),
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextButton(
                        onPressed: () {
                          globalMethods.navigateToPage(
                              context: context,
                              page: AllProductsWidget.routeName);
                        },
                        child: const Text(
                          "عرض الكل",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TitleWidget(
                        title: "الجديد",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.23,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: ScrollController(initialScrollOffset: 90000),
                    // rtl
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: 22,
                    itemBuilder: (context, index) {
                      return ProductContainerWidget(
                        height: size.height * 0.21,
                        width: size.height * 0.193,
                        imgHeight: size.height * 0.16,
                        imgWidth: size.height * 0.16,
                      );
                      ;
                    },
                  ),
                ),
                // promotion

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextButton(
                        onPressed: () {
                          globalMethods.navigateToPage(
                              context: context,
                              page: AllProductsWidget.routeName);
                        },
                        child: Text(
                          "عرض الكل",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.headline3!.color,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TitleWidget(
                        title: "الأكثر مبيعا",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.23,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: ScrollController(initialScrollOffset: 90000),
                    // rtl
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: 22,
                    itemBuilder: (context, index) {
                      return ProductContainerWidget(
                        height: size.height * 0.21,
                        width: size.height * 0.193,
                        imgHeight: size.height * 0.16,
                        imgWidth: size.height * 0.16,
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
