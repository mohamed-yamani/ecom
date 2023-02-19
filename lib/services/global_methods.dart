import 'package:flutter/material.dart';

class GlobalMethods {
  void navigateToPage({required BuildContext context, required String page}) {
    Navigator.pushNamed(
      context,
      page,
    );
  }
}
