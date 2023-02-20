import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
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
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = Utils(context).getScreenSize;
    GlobalMethods globalMethods = GlobalMethods();
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FancyShimmerImage(
                  imageUrl:
                      'https://cdn.youcan.shop/stores/c749137d893cf429107e4a8c5fd443b6/products/bFyGtp4QUP8hQqPaFEIy8JWcw0BQkuKPEaf8BYWC_lg.png',
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
                        TitleWidget(title: 'كريم أساس خافي للعيوب'),
                        Text(
                          '199 درهم',
                          style: themeState.getDarkTheme
                              ? const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)
                              : const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '''صديقة للبشرة وسلسة وتضغط بسهولة وبالتساوي.
          رأس اسفنجي لطيف يصبح أكبر وأنعم وسهل الاستخدام عندما يلتقي بالماء.
          يغطي عيوب البشرة بشكل طبيعي ويخفي المسام ويخلق مكياج مرطب طبيعي.
          ملمس ناعم ورقيق، لا يسد المسام، مما يسمح للبشرة بالتنفس بحرية.
          ما يجب مراعاته قبل المكياج:
          إذا كنتي ترغبين في جعله يبدو جيداً ويدوم طويلاً. قومي بما يلي:
          التزمي بالعناية الأساسية للبشرة.
          يجب تنظيف الرأس الاسفنجي على شكل الفطر قبل الاستخدام.
          ضعي المكياج بطريقة الكبس بسرعة حتى يصبح المكياج أكثر سلاسة.
          بعد وضع المكياج، استخدمي البودرة، ثم استخدمي بخاخ تثبيت المكياج ورشي المكياج برفق. هذا المكياج يمكن أن يحقق تأثيراً يدوم طويلاً.''',
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
                      onPressed: () {},
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
                        children: const [
                          Text(
                            'أضف إلى السلة',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
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
