import 'package:card_swiper/card_swiper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marocbeauty/consts/constss.dart';
import 'package:marocbeauty/consts/firebase_consts.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/screens/auth/login.dart';
import 'package:marocbeauty/screens/bottom_bar_screen.dart';
import 'package:marocbeauty/screens/loading_manager.dart';
import 'package:marocbeauty/services/global_methods.dart';
import 'package:marocbeauty/services/utils.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/sign-up';
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _fullNameController = TextEditingController();
  final _emailextController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _shippingAddressController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureTextConfirm = true;

  @override
  void dispose() {
    _emailextController.dispose();
    _passwordController.dispose();
    _passFocusNode.dispose();
    _fullNameController.dispose();
    _confirmPasswordController.dispose();
    _shippingAddressController.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  void _submitFormOnRegister(BuildContext context) async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });

    if (isValid) {
      print('The form is valid');
      _formKey.currentState!.save();
      try {
        await authInstance
            .createUserWithEmailAndPassword(
                email: _emailextController.text.toLowerCase().trim(),
                password: _passwordController.text)
            .then((value) {
          Navigator.of(context).pushReplacementNamed(BottomBarScreen.routeName);
          Toast.show(
            'تم التسجيل بنجاح',
          );
        });
      } on FirebaseException catch (error) {
        GlobalMethods().showDialogg(
            content: error.message!, context: context, title: 'حدث خطأ');
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        print('An error occured $error');
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: LoadingManager(
        isLoading: _isLoading,
        child: Stack(
          children: [
            Swiper(
              indicatorLayout: PageIndicatorLayout.NONE,
              outer: false,
              allowImplicitScrolling: true,
              loop: true,
              curve: Curves.easeIn,
              // hide pagination

              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  Constss.authImagesPath[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: Constss.authImagesPath.length,
              // control: const SwiperControl(),
              autoplay: true,
              autoplayDelay: 2000,
              duration: 10,
              autoplayDisableOnInteraction: true,
              pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                    color: Colors.transparent, activeColor: Colors.transparent),
              ),
              control: const SwiperControl(
                color: Colors.transparent,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.7),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: size.height * 0.13,
                    ),
                    Text(
                      'مرحبا بك',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Text(
                      'سجل الآن',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_passFocusNode),
                            controller: _fullNameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {},
                            decoration: InputDecoration(
                              labelText: 'الاسم الكامل',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.002,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_passFocusNode),
                            controller: _emailextController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'الرجاء إدخال عنوان بريد إلكتروني صالح';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'البريد الإلكتروني',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            onEditingComplete: () =>
                                _submitFormOnRegister(context),
                            focusNode: _passFocusNode,
                            obscureText: _obscureText,
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 5) {
                                return 'الرجاء إدخال كلمة مرور صالحة';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              suffix: InkWell(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                              labelText: 'كلمة المرور',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            onEditingComplete: () =>
                                _submitFormOnRegister(context),
                            // focusNode: _passFocusNode,
                            obscureText: _obscureTextConfirm,
                            controller: _confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 5) {
                                return 'الرجاء إدخال كلمة مرور صالحة';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              suffix: InkWell(
                                onTap: () {
                                  setState(() {
                                    _obscureTextConfirm = !_obscureTextConfirm;
                                  });
                                },
                                child: Icon(
                                  _obscureTextConfirm
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                              labelText: 'تأكيد كلمة المرور',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: size.height * 0.07,
                            child: ElevatedButton(
                              onPressed: () => _submitFormOnRegister(context),
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'تسجيل الدخول',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'لديك حساب؟',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Colors.white),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(
                                    LoginScreen.routeName,
                                  );
                                },
                                child: Text(
                                  'تسجيل الدخول',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
