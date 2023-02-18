import 'package:flutter/material.dart';
import 'package:marocbeauty/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Center(
          child: SwitchListTile(
              title: Text('Dark Theme',
                  style: TextStyle(
                      fontSize: 20,
                      color: themeState.getDarkTheme
                          ? Colors.white
                          : Colors.black)),
              secondary: Icon(
                  themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.brightness_4,
                  color: themeState.getDarkTheme ? Colors.white : Colors.black),
              value: themeState.getDarkTheme,
              onChanged: (bool value) {
                themeState.setDarkTheme = value;
              })),
    );
  }
}
