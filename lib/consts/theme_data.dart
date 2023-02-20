import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
          //0A1931  // white yellow 0xFFFCF8EC
          isDarkTheme
              ? const Color.fromARGB(255, 7, 0, 5)
              : const Color(0xFFFFFFFF),
      // #E49296FF primaryColor
      primaryColor: const Color.fromARGB(255, 250, 26, 168),
      // primaryColorLight: Color.fromARGB(255, 254, 169, 173),
      // primaryColorDark: Color.fromARGB(255, 155, 4, 11),
      backgroundColor: isDarkTheme
          ? Color.fromARGB(255, 249, 102, 183)
          : const Color.fromARGB(255, 255, 62, 71),
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: isDarkTheme
                ? Color.fromARGB(255, 249, 102, 183)
                : Color.fromARGB(255, 237, 152, 4),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor: isDarkTheme
          ? const Color.fromARGB(255, 12, 1, 5)
          : const Color(0xFFF2FDFD),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      accentColor: isDarkTheme ? Colors.white : Colors.black,
      focusColor: isDarkTheme ? Colors.white : Colors.black,
      primaryColorBrightness: isDarkTheme ? Brightness.dark : Brightness.light,
    );
  }
}
