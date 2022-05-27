import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio/dark_theme_preference.dart';
import 'package:portfolio/globals.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme =
      SchedulerBinding.instance.window.platformBrightness == Brightness.dark;
  String _color = 'purple';
  int _selected = colors.indexOf('purple');
  String _gradientImageUrl = './assets/purple_gradient.png';

  bool get darkTheme => _darkTheme;
  String get color => _color;
  int get selected => _selected;
  String get gradientImageUrl => _gradientImageUrl;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }

  set color(String value) {
    _color = value;
    darkThemePreference.setColor(value);
    notifyListeners();
  }

  set selected(int value) {
    _selected = value;
    darkThemePreference.setSelected(value);
    notifyListeners();
  }

  set gradientImageUrl(String value) {
    _gradientImageUrl = value;
    darkThemePreference.setGradientImageUrl(value);
    notifyListeners();
  }
}
