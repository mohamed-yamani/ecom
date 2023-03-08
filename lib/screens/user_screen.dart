import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marocbeauty/consts/firebase_consts.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:marocbeauty/screens/auth/login.dart';
import 'package:marocbeauty/screens/orders/orders_screen.dart';
import 'package:marocbeauty/services/global_methods.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController = TextEditingController();

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    GlobalMethods globalMethods = GlobalMethods();
    final googleSignIn = GoogleSignIn();

    TextEditingController();
    final User? user = authInstance.currentUser;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          if (user != null)
            Column(
              children: [
                listTile(
                    context: context,
                    icon: CupertinoIcons.person,
                    title: 'فلان الفلاني',
                    subtitle: 'فلان الفلاني',
                    onTap: () => {},
                    trailingIcon: null),
                const SizedBox(
                  height: 20,
                ),
                listTile(
                    context: context,
                    icon: CupertinoIcons.phone,
                    title: 'الهاتف',
                    subtitle: '+33 6 00 00 00 00',
                    onTap: () => {},
                    trailingIcon: null),
                const SizedBox(
                  height: 20,
                ),
                listTile(
                    context: context,
                    icon: CupertinoIcons.location,
                    title: 'العنوان',
                    subtitle: 'المغرب, الرباط',
                    onTap: () async {
                      _showAddressDialog();
                    },
                    trailingIcon: null),
                const SizedBox(
                  height: 20,
                ),
                // orders
                listTile(
                    context: context,
                    icon: CupertinoIcons.bag,
                    title: 'الطلبات',
                    subtitle: 'عرض الطلبات',
                    onTap: () => {
                          globalMethods.navigateToPage(
                              context: context, page: OrdersScreen.routeName)
                        },
                    trailingIcon: null),
                const SizedBox(
                  height: 20,
                ),

                listTile(
                    context: context,
                    icon: CupertinoIcons.arrow_uturn_left,
                    title: 'تسجيل الخروج',
                    subtitle: 'تسجيل الخروج',
                    onTap: () => GlobalMethods().warningDialog(
                        context: context,
                        title: "تسجيل الخروج",
                        subtitle: "هل تريد تسجيل الخروج؟",
                        function: () => {
                              authInstance.signOut(),
                              if (googleSignIn.currentUser != null)
                                googleSignIn.signOut(),
                              globalMethods.navigateToPage(
                                context: context,
                                page: LoginScreen.routeName,
                              )
                            }),
                    trailingIcon: null),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          if (user == null)
            Column(
              children: [
                SizedBox(
                  height: 120,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        'يجب عليك تسجيل الدخول أولا',
                        style: TextStyle(
                            color: themeState.getDarkTheme
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                listTile(
                    context: context,
                    icon: CupertinoIcons.person,
                    title: 'تسجيل الدخول',
                    subtitle: 'إضغط هنا لتسجيل الدخول',
                    onTap: () => GlobalMethods().warningDialog(
                        context: context,
                        title: "تسجيل الدخول",
                        subtitle: "هل تريد تسجيل الدخول؟",
                        function: () => {
                              authInstance.signOut(),
                              globalMethods.navigateToPage(
                                  context: context, page: LoginScreen.routeName)
                            }),
                    trailingIcon: null),
              ],
            ),
          Center(
              child: SwitchListTile(
                  title: Text('السمة',
                      style: TextStyle(
                          color: themeState.getDarkTheme
                              ? Colors.white
                              : Colors.black)),
                  secondary: Icon(
                      themeState.getDarkTheme
                          ? CupertinoIcons.moon
                          : CupertinoIcons.sun_max,
                      color: Theme.of(context).primaryColor),
                  activeColor: Theme.of(context).primaryColor,
                  value: themeState.getDarkTheme,
                  onChanged: (bool value) {
                    themeState.setDarkTheme = value;
                  })),
        ],
      ),
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.white70,
            height: 200,
            width: MediaQuery.of(context).size.width * 0.8,
            child: AlertDialog(
              title: const Text('Update your address'),
              content: TextField(
                onChanged: (value) {
                  _addressTextController.text = value;
                },
                controller: _addressTextController,
                maxLines: 3,
                cursorColor: Theme.of(context).primaryColor,
                decoration:
                    const InputDecoration(hintText: 'Enter your address'),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Update',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    )),
              ],
            ),
          );
        });
  }

  Widget listTile(
      {required BuildContext context,
      required String title,
      required IconData icon,
      required String subtitle,
      Function()? onTap,
      IconData? trailingIcon}) {
    return ListTile(
      leading: Icon(icon),
      iconColor: Theme.of(context).primaryColor,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(trailingIcon, color: Colors.grey),
      onTap: onTap,
    );
  }
}
