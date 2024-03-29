import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:marocbeauty/consts/theme_data.dart';
import 'package:marocbeauty/fetch_screen.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/providers/cart_provider.dart';
import 'package:marocbeauty/providers/products_provider.dart';
import 'package:marocbeauty/screens/all_products_widget.dart';
import 'package:marocbeauty/screens/auth/forget_password.dart';
import 'package:marocbeauty/screens/auth/login.dart';
import 'package:marocbeauty/screens/auth/sign_up.dart';
import 'package:marocbeauty/screens/bottom_bar_screen.dart';
import 'package:marocbeauty/screens/orders/orders_screen.dart';
import 'package:marocbeauty/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  bool isUserLoggedIn = false;

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getDarkTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    checkIfUserLoggedIn();
    super.initState();
  }

  Future<bool> checkIfUserLoggedIn() async {
    // ignore: await_only_futures
    await Firebase.initializeApp();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = await _auth.currentUser;
    if (user != null) {
      setState(() {
        isUserLoggedIn = true;
      });
      return true;
    } else {
      setState(() {
        isUserLoggedIn = false;
      });
      return false;
    }
  }

  // This widget is the root of your application.
  final Future<FirebaseApp> _firebaseInitilization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _firebaseInitilization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const MaterialApp(
              home: Center(
                child: Text('Error'),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) {
                  return themeChangeProvider;
                }),
                ChangeNotifierProvider(create: (_) {
                  return ProductsProvider();
                }),
                ChangeNotifierProvider(create: (_) {
                  return CartProvider();
                })
              ],
              child: Consumer<DarkThemeProvider>(
                  builder: (context, themeProvider, child) {
                return MaterialApp(
                  localizationsDelegates: const [
                    GlobalCupertinoLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale("fa",
                        "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
                  ],
                  locale: const Locale("fa",
                      "IR"), // OR Locale('ar', 'AE') OR Other RTL locales,
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: Styles.themeData(themeProvider.getDarkTheme, context),
                  // home: const BottomBarScreen(),
                  home: isUserLoggedIn
                      ? const BottomBarScreen()
                      // : const LoginScreen(),
                      : const BottomBarScreen(),
                  routes: {
                    // HomeScreen.routeName: (context) => const HomeScreen(),
                    AllProductsWidget.routeName: (context) =>
                        const AllProductsWidget(),
                    ProductDetailsScreen.routeName: (context) =>
                        const ProductDetailsScreen(),
                    OrdersScreen.routeName: (context) => const OrdersScreen(),
                    BottomBarScreen.routeName: (context) =>
                        const BottomBarScreen(),
                    SignUp.routeName: (context) => const SignUp(),
                    LoginScreen.routeName: (context) => const LoginScreen(),
                    ForgetPassword.routeName: (context) =>
                        const ForgetPassword(),
                    FetchScreen.routeName: (context) => const FetchScreen(),
                  },
                );
              }),
            );
          } else {
            return const MaterialApp(
              home: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
