import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const DARKMODE_STATUS = "DarkMode_Status";

  setDarkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(DARKMODE_STATUS, value);
  }

  Future<bool> getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(DARKMODE_STATUS) ?? false;
  }
}
