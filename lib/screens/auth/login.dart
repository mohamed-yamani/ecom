import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailextController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passFocusNode = FocusNode();

  @override
  void dispose() {
    _emailextController.dispose();
    _passwordController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  void _submitFormOnLogin() {
    final enteredEmail = _emailextController.text;
    final enteredPassword = _passwordController.text;

    if (enteredEmail.isEmpty || enteredPassword.isEmpty) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(),
        ],
      ),
    );
  }
}
