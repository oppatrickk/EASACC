import 'package:flutter/material.dart';

class ThemeService with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  final Color _seedColor = Color(0xFF05A8AD);

  late ColorScheme _lightScheme = ColorScheme.fromSeed(seedColor: _seedColor, brightness: Brightness.light);
  late ColorScheme _darkScheme = ColorScheme.fromSeed(seedColor: _seedColor, brightness: Brightness.dark);

  ThemeMode get themeMode => _themeMode;
  Color get seedColor => _seedColor;
  ColorScheme get lightScheme => _lightScheme;
  ColorScheme get darkScheme => _darkScheme;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void setLightScheme(ColorScheme scheme) {
    _lightScheme = scheme;
    notifyListeners();
  }

  void setDarkScheme(ColorScheme scheme) {
    _darkScheme = scheme;
    notifyListeners();
  }
}
