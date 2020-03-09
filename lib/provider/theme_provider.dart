import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.pink,
  scaffoldBackgroundColor: Color(0xfff1f1f1),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.indigo,
  accentColor: Colors.pink,
);

class ThemeChangeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _sharedPreferences;

  bool _isDarkTheme;

  bool get isDarkTheme => _isDarkTheme;

  ThemeChangeNotifier() {
    _isDarkTheme = true;
    _initPrefs();
  }

  toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    _saveToPreference();
  }

  _initPrefs() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _isDarkTheme = await _sharedPreferences.get(key) ?? true;
    notifyListeners();
  }

  _saveToPreference() async {
    await _sharedPreferences.setBool(key, _isDarkTheme);
    notifyListeners();
  }
}
