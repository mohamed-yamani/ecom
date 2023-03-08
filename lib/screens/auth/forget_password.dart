import 'package:card_swiper/card_swiper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marocbeauty/consts/constss.dart';
import 'package:marocbeauty/consts/firebase_consts.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/screens/auth/login.dart';
import 'package:marocbeauty/screens/auth/sign_up.dart';
import 'package:marocbeauty/screens/loading_manager.dart';
import 'package:marocbeauty/services/global_methods.dart';
import 'package:marocbeauty/services/utils.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  static const routeName = '/forget-password';
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _passFocusNode = FocusNode();
  bool _isLoading = false;

  void _forgetPassword(context) async {
    if (_emailextController.text.isEmpty ||
        !_emailextController.text.contains(
          '@',
        )) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'الرجاء ادخال البريد الالكتروني',
            textAlign: TextAlign.center,
          ),
        ),
      );
      return;
    } else {
      setState(() {
        _isLoading = true;
      });
      try {
        await authInstance.sendPasswordResetEmail(
            email: _emailextController.text.toLowerCase());
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'تم ارسال رابط استعادة كلمة المرور الى البريد الالكتروني',
            textAlign: TextAlign.center,
          ),
        );
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      } on FirebaseException catch (error) {
        GlobalMethods().showDialogg(
            content: error.message!, context: context, title: 'حدث خطأ');

        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
    {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailextController.dispose();
    super.dispose();
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
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  Constss.authImagesPath[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: Constss.authImagesPath.length,
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
                      height: size.height * 0.16,
                    ),
                    Text(
                      'نسيت كلمة المرور',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Text(
                      'سجل دخولك للمتابعة',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
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
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: size.height * 0.07,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context).pushReplacementNamed(
                                //   LoginScreen.routeName,

                                // );
                                _forgetPassword(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'إرسال',
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
