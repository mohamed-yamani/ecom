import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
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

    TextEditingController();
    return Scaffold(
      body: ListView(
        children: <Widget>[
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
          // addresses

          // Wishlist
          // listTile(
          //     context: context,
          //     icon: CupertinoIcons.heart,
          //     title: 'Wishlist',
          //     subtitle: 'View your wishlist',
          //     onTap: () => {},
          //     trailingIcon: null),
          // const SizedBox(
          //   height: 20,
          // ),
          // Viewed products
          listTile(
              context: context,
              icon: CupertinoIcons.eyeglasses,
              title: 'المنتجات المشاهدة',
              subtitle: 'عرض المنتجات المشاهدة',
              onTap: () => {},
              trailingIcon: null),
          // logout
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
                  function: () => {}),
              trailingIcon: null),
          const SizedBox(
            height: 20,
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
