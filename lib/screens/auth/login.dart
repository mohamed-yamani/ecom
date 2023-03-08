import 'package:card_swiper/card_swiper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marocbeauty/consts/constss.dart';
import 'package:marocbeauty/consts/firebase_consts.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/screens/auth/forget_password.dart';
import 'package:marocbeauty/screens/auth/sign_up.dart';
import 'package:marocbeauty/screens/bottom_bar_screen.dart';
import 'package:marocbeauty/screens/loading_manager.dart';
import 'package:marocbeauty/services/global_methods.dart';
import 'package:marocbeauty/services/utils.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailextController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailextController.dispose();
    _passwordController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  void _submitFormOnLogin(BuildContext context) async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });

    if (isValid) {
      _formKey.currentState!.save();
      try {
        await authInstance
            .signInWithEmailAndPassword(
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
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _submitFormOnRegister() {
    final enteredEmail = _emailextController.text;
    final enteredPassword = _passwordController.text;

    if (enteredEmail.isEmpty || enteredPassword.isEmpty) {
      return;
    }
  }

  Future<void> googleSignIn(context) async {
    setState(() {
      _isLoading = true;
    });
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();

    if (googleAccount != null) {
      try {
        await authInstance
            .signInWithCredential(GoogleAuthProvider.credential(
                idToken: (await googleAccount.authentication).idToken,
                accessToken: (await googleAccount.authentication).accessToken))
            .then((value) {
          Navigator.of(context).pushReplacementNamed(BottomBarScreen.routeName);
          Toast.show(
            'تم التسجيل بنجاح',
          );
        });
        setState(() {
          _isLoading = false;
        });
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
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = Utils(context).getScreenSize;
    return LoadingManager(
      isLoading: _isLoading,
      child: Scaffold(
        body: Stack(
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
                      height: size.height * 0.07,
                    ),
                    Text(
                      'مرحبًا بعودتك',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: size.height * 0.003,
                    ),
                    Text(
                      'سجل دخولك للمتابعة',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
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
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            onEditingComplete: () =>
                                _submitFormOnLogin(context),
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
                                      ? CupertinoIcons.eye
                                      : CupertinoIcons.eye_slash,
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  ForgetPassword.routeName,
                                );
                              },
                              child: Text(
                                'هل نسيت كلمة المرور؟',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
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
                              onPressed: () => _submitFormOnLogin(context),
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

                          // login with google
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: size.height * 0.07,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: InkWell(
                                onTap: () => googleSignIn(context),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/google_icon.png',
                                      width: size.width * 0.05,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.03,
                                    ),
                                    Text(
                                      'تسجيل الدخول بحساب جوجل',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ],
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
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(
                                  SignUp.routeName,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'إنشاء حساب جديد',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          // or continue as guest
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'أو تابع كضيف',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Colors.white),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushReplacementNamed(
                                    BottomBarScreen.routeName,
                                  );
                                },
                                child: Container(
                                  width: size.width * 0.1,
                                  height: size.width * 0.1,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Theme.of(context).primaryColor,
                                  ),
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
            )
          ],
        ),
      ),
    );
  }
}
