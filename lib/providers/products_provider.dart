import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:marocbeauty/models/products_model.dart';

class ProductsProvider with ChangeNotifier {
  final List<ProductModel> productsList = [];
  List<ProductModel> get getProducts {
    return productsList;
  }

  List<ProductModel> get getOnSaleProducts {
    return productsList
        .where((element) => element.price > element.SalePrice)
        .toList();
  }

  List<ProductModel> getProductByCategory(String category) {
    if (category.toLowerCase().contains("all")) {
      return productsList;
    } else if (category.toLowerCase().contains("onsale")) {
      return productsList
          .where((element) => element.price > element.SalePrice)
          .toList();
    } else {
      return productsList
          .where((element) =>
              element.productCategoryId.toLowerCase().contains(category))
          .toList();
    }
  }

  Future<void> fetchProducts() async {
    // await FirebaseFirestore.instance.collection("products").get().then((
    //   QuerySnapshot productsSnapshot,
    // ) {
    //   productsSnapshot.docs.forEach((element) {
    //     productsList.add(
    //       ProductModel(
    //         id: element.id,
    //         productCategoryId: element.get("productCategoryId"),
    //         title: element.get("title"),
    //         imageUrl: element.get("imageUrl"),
    //         price: element.get("price"),
    //         isOnSale: element.get("isOnSale"),
    //         isPiece: element.get("isPiece"),
    //         productCategoryName: element.get("productCategoryName"),
    //         SalePrice: element.get("SalePrice"),
    //         details: element.get("details"),
    //       ),
    //     );
    //   });
    // });
    var querySnapshot =
        await FirebaseFirestore.instance.collection("products").get();
    if (querySnapshot.docs.isNotEmpty) {
      print("data" + querySnapshot.docs.toString());
      querySnapshot.docs.forEach((element) {
        productsList.add(
          ProductModel(
            id: element.id,
            productCategoryId: element.get("productCategoryName"),
            title: element.get("title"),
            imageUrl: element.get("imageUrl"),
            price: double.parse(element.get("price")),
            isOnSale: element.get("isOnSale"),
            isPiece: element.get("isPiece"),
            productCategoryName: element.get("productCategoryName"),
            SalePrice: element.get("salePrice"),
            // details: element.get("details"),
            details: "details here",
          ),
        );
      });
    } else {
      print("No data");
    }
    notifyListeners();
  }

  ProductModel findProductById(String productId) {
    return productsList.firstWhere((element) => element.id == productId);
  }

  List<ProductModel> findByIdCategory(String categoryName) {
    List<ProductModel> _categoryList = productsList
        .where((element) => element.productCategoryName
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

//   static final List<ProductModel> productsList = [
//     ProductModel(
//         id: "1",
//         productCategoryId: "1",
//         title: "منتج 1",
//         imageUrl:
//             "https://img.freepik.com/vecteurs-libre/conception-couronne-cosmetique-recourbe-cils-eye-liner-pinceau_83728-1850.jpg?w=2000",
//         price: 10,
//         isOnSale: false,
//         isPiece: true,
//         productCategoryName: "منتجات العناية بالبشرة",
//         SalePrice: 10,
//         details: '''صديقة للبشرة1 وسلسة وتضغط بسهولة وبالتساوي.
// رأس اسفنجي لطيف يصبح أكبر وأنعم وسهل الاستخدام عندما يلتقي بالماء.
// يغطي عيوب البشرة بشكل طبيعي ويخفي المسام ويخلق مكياج مرطب طبيعي.
// ملمس ناعم ورقيق، لا يسد المسام، مما يسمح للبشرة بالتنفس بحرية.
// ما يجب مراعاته قبل المكياج:
// إذا كنتي ترغبين في جعله يبدو جيداً ويدوم طويلاً. قومي بما يلي:
// التزمي بالعناية الأساسية للبشرة.
// يجب تنظيف الرأس الاسفنجي على شكل الفطر قبل الاستخدام.
// ضعي المكياج بطريقة الكبس بسرعة حتى يصبح المكياج أكثر سلاسة.
// بعد وضع المكياج، استخدمي البودرة، ثم استخدمي بخاخ تثبيت المكياج ورشي المكياج برفق. هذا المكياج يمكن أن يحقق تأثيراً يدوم طويلاً.'''),
//     ProductModel(
//         id: "2",
//         productCategoryId: "2",
//         title: "منتج 2",
//         imageUrl:
//             "https://res.cloudinary.com/hamstech/images/f_auto,q_auto/v1646637942/Hamstech%20App/Title-Image-3_80466666986a5/Title-Image-3_80466666986a5.jpg?_i=AA",
//         price: 100,
//         isOnSale: true,
//         isPiece: true,
//         productCategoryName: "منتجات العناية بالبشرة",
//         SalePrice: 50,
//         details: '''صديقة للبشرة2 وسلسة وتضغط بسهولة وبالتساوي.
// رأس اسفنجي لطيف يصبح أكبر وأنعم وسهل الاستخدام عندما يلتقي بالماء.
// يغطي عيوب البشرة بشكل طبيعي ويخفي المسام ويخلق مكياج مرطب طبيعي.
// ملمس ناعم ورقيق، لا يسد المسام، مما يسمح للبشرة بالتنفس بحرية.
// ما يجب مراعاته قبل المكياج:
// إذا كنتي ترغبين في جعله يبدو جيداً ويدوم طويلاً. قومي بما يلي:
// التزمي بالعناية الأساسية للبشرة.
// يجب تنظيف الرأس الاسفنجي على شكل الفطر قبل الاستخدام.
// ضعي المكياج بطريقة الكبس بسرعة حتى يصبح المكياج أكثر سلاسة.
// بعد وضع المكياج، استخدمي البودرة، ثم استخدمي بخاخ تثبيت المكياج ورشي المكياج برفق. هذا المكياج يمكن أن يحقق تأثيراً يدوم طويلاً.'''),
//     ProductModel(
//         id: "3",
//         productCategoryId: "1",
//         title: "منتجات العناية العناية العناية بالبشرة",
//         imageUrl: "https://m.timesofindia.com/photo/95103361/95103361.jpg",
//         price: 100,
//         isOnSale: true,
//         isPiece: true,
//         productCategoryName: "منتجات العناية بالبشرة",
//         SalePrice: 50,
//         details: '''صديقة للبشرة3 وسلسة وتضغط بسهولة وبالتساوي.
// رأس اسفنجي لطيف يصبح أكبر وأنعم وسهل الاستخدام عندما يلتقي بالماء.
// يغطي عيوب البشرة بشكل طبيعي ويخفي المسام ويخلق مكياج مرطب طبيعي.
// ملمس ناعم ورقيق، لا يسد المسام، مما يسمح للبشرة بالتنفس بحرية.
// ما يجب مراعاته قبل المكياج:
// إذا كنتي ترغبين في جعله يبدو جيداً ويدوم طويلاً. قومي بما يلي:
// التزمي بالعناية الأساسية للبشرة.
// يجب تنظيف الرأس الاسفنجي على شكل الفطر قبل الاستخدام.
// ضعي المكياج بطريقة الكبس بسرعة حتى يصبح المكياج أكثر سلاسة.
// بعد وضع المكياج، استخدمي البودرة، ثم استخدمي بخاخ تثبيت المكياج ورشي المكياج برفق. هذا المكياج يمكن أن يحقق تأثيراً يدوم طويلاً.'''),
//     ProductModel(
//         id: "4",
//         productCategoryId: "1",
//         title: "منتج 4",
//         imageUrl:
//             "https://i0.wp.com/post.healthline.com/wp-content/uploads/2022/02/makeup-overhead-1296-728-header.jpg?w=1155&h=1528",
//         price: 100,
//         isOnSale: true,
//         isPiece: true,
//         productCategoryName: "منتجات العناية بالبشرة",
//         SalePrice: 50,
//         details: '''صديقة للبشرة4 وسلسة وتضغط بسهولة وبالتساوي.
// رأس اسفنجي لطيف يصبح أكبر وأنعم وسهل الاستخدام عندما يلتقي بالماء.
// يغطي عيوب البشرة بشكل طبيعي ويخفي المسام ويخلق مكياج مرطب طبيعي.
// ملمس ناعم ورقيق، لا يسد المسام، مما يسمح للبشرة بالتنفس بحرية.
// ما يجب مراعاته قبل المكياج:
// إذا كنتي ترغبين في جعله يبدو جيداً ويدوم طويلاً. قومي بما يلي:
// التزمي بالعناية الأساسية للبشرة.
// يجب تنظيف الرأس الاسفنجي على شكل الفطر قبل الاستخدام.
// ضعي المكياج بطريقة الكبس بسرعة حتى يصبح المكياج أكثر سلاسة.
// بعد وضع المكياج، استخدمي البودرة، ثم استخدمي بخاخ تثبيت المكياج ورشي المكياج برفق. هذا المكياج يمكن أن يحقق تأثيراً يدوم طويلاً.'''),
//     ProductModel(
//         id: "5",
//         productCategoryId: "1",
//         title: "منتج 5",
//         imageUrl:
//             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdtB-sxFziWYs5Fik53a8KFZQ426ckXyBhXw&usqp=CAU",
//         price: 100,
//         isOnSale: true,
//         isPiece: true,
//         productCategoryName: "منتجات العناية بالبشرة",
//         SalePrice: 50,
//         details: '''صديقة للبشرة5 وسلسة وتضغط بسهولة وبالتساوي.
// رأس اسفنجي لطيف يصبح أكبر وأنعم وسهل الاستخدام عندما يلتقي بالماء.
// يغطي عيوب البشرة بشكل طبيعي ويخفي المسام ويخلق مكياج مرطب طبيعي.
// ملمس ناعم ورقيق، لا يسد المسام، مما يسمح للبشرة بالتنفس بحرية.
// ما يجب مراعاته قبل المكياج:
// إذا كنتي ترغبين في جعله يبدو جيداً ويدوم طويلاً. قومي بما يلي:
// التزمي بالعناية الأساسية للبشرة.
// يجب تنظيف الرأس الاسفنجي على شكل الفطر قبل الاستخدام.
// ضعي المكياج بطريقة الكبس بسرعة حتى يصبح المكياج أكثر سلاسة.
// بعد وضع المكياج، استخدمي البودرة، ثم استخدمي بخاخ تثبيت المكياج ورشي المكياج برفق. هذا المكياج يمكن أن يحقق تأثيراً يدوم طويلاً.'''),
//     ProductModel(
//         id: "6",
//         productCategoryId: "2",
//         title: "منتج 6",
//         imageUrl:
//             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBEg1TFhqcaj2qERw0tXHaq4VKMJYPcOwp-A&usqp=CAU",
//         price: 199,
//         isOnSale: false,
//         isPiece: true,
//         productCategoryName: "منتجات العناية بالبشرة",
//         SalePrice: 199,
//         details: '''صديقة للبشرة6 وسلسة وتضغط بسهولة وبالتساوي.
// رأس اسفنجي لطيف يصبح أكبر وأنعم وسهل الاستخدام عندما يلتقي بالماء.
// يغطي عيوب البشرة بشكل طبيعي ويخفي المسام ويخلق مكياج مرطب طبيعي.
// ملمس ناعم ورقيق، لا يسد المسام، مما يسمح للبشرة بالتنفس بحرية.
// ما يجب مراعاته قبل المكياج:
// إذا كنتي ترغبين في جعله يبدو جيداً ويدوم طويلاً. قومي بما يلي:
// التزمي بالعناية الأساسية للبشرة.
// يجب تنظيف الرأس الاسفنجي على شكل الفطر قبل الاستخدام.
// ضعي المكياج بطريقة الكبس بسرعة حتى يصبح المكياج أكثر سلاسة.
// بعد وضع المكياج، استخدمي البودرة، ثم استخدمي بخاخ تثبيت المكياج ورشي المكياج برفق. هذا المكياج يمكن أن يحقق تأثيراً يدوم طويلاً.'''),
//   ];
}
