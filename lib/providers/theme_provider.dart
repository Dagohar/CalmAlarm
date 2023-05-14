import 'package:calmalarm/shared_preferences/theme_preference.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreference themePreference = ThemePreference();

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool value) {
    _darkMode = value;
    themePreference.setDarkMode(value);
    notifyListeners();
  }
}
