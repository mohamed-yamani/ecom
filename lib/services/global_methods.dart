import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalMethods {
  void navigateToPage({required BuildContext context, required String page}) {
    Navigator.pushNamed(
      context,
      page,
    );
  }

  void navigateToPageWithReplacement(
      {required BuildContext context, required String page}) {
    Navigator.pushReplacementNamed(
      context,
      page,
    );
  }

  void showDialogg(
      {required BuildContext context,
      required String title,
      required String content}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  Future<void> warningDialog({
    required BuildContext context,
    required String title,
    required String subtitle,
    required Function function,
  }) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(
                  CupertinoIcons.exclamationmark_circle,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(title),
              ],
            ),
            content: Text(subtitle),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'إلغاء',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    function();
                  },
                  child: Text(
                    'موافق',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )),
            ],
          );
        });
  }
}
