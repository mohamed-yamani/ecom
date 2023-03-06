import 'package:flutter/material.dart';
import 'package:marocbeauty/widgets/categories_widget.dart';

List<Map<String, dynamic>> categoriesInfo = [
  {
    'categoryImage': 'assets/images/category1.png',
    'categoryName': 'منتجات للعناية بالبشرة',
    'color': const Color.fromARGB(255, 252, 127, 25),
    'categoryId': 1,
  },
  {
    'categoryImage': 'assets/images/category2.png',
    'categoryName': 'منتجات للعناية بالشعر',
    'color': const Color.fromARGB(255, 255, 239, 9),
    'categoryId': 2,
  },
  {
    'categoryImage': 'assets/images/category3.png',
    'categoryName': 'منتوجات الخاصة بالشفاه',
    'color': const Color.fromARGB(255, 255, 126, 6),
    'categoryId': 3,
  },
  {
    'categoryImage': 'assets/images/category6.png',
    'categoryName': 'منتجات للعناية بالأظافر',
    'color': const Color.fromARGB(255, 252, 25, 131),
    'categoryId': 4,
  },
  {
    'categoryImage': 'assets/images/category4.png',
    'categoryName': 'منتجات للعناية بالجسم',
    'color': const Color.fromARGB(255, 252, 127, 25),
    'categoryId': 5,
  },
  {
    'categoryImage': 'assets/images/category5.png',
    'categoryName': 'منتجات للعناية بالعيون',
    'color': const Color.fromARGB(255, 21, 20, 19),
    'categoryId': 6,
  }
];

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 380,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: categoriesInfo
              .map((e) => CategoriesWidget(
                    categoryImage: e['categoryImage'],
                    categoryName: e['categoryName'],
                    color: e['color'],
                    categoryId: e['categoryId'],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
