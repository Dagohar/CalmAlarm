import 'package:flutter/material.dart';

class Styles {
  static ThemeData appThemeData(bool isDarkTheme, BuildContext context) {
    return ThemeData (
      colorSchemeSeed: isDarkTheme ? Colors.green : Colors.blue,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        elevation: 4
      )
    );
  }
}