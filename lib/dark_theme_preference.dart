import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive/hive.dart';

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";
  static const COLOR_STATUS = "COLORSTATUS";
  static const SELECTED_STATUS = "SELECTEDSTATUS";
  static const GRADIENT_IMAGE_STATUS = "GRADIENTIMAGESTATUS";

  setDarkTheme(bool value) async {
    var prefs = await Hive.openBox('Storage');
    prefs.put(THEME_STATUS, value);
  }

  setColor(String value) async {
    var prefs = await Hive.openBox('Storage');
    prefs.put(COLOR_STATUS, value);
  }

  setSelected(int value) async {
    var prefs = await Hive.openBox('Storage');
    prefs.put(SELECTED_STATUS, value);
  }

  setGradientImageUrl(String value) async {
    var prefs = await Hive.openBox('Storage');
    prefs.put(GRADIENT_IMAGE_STATUS, value);
  }

  Future<bool> getTheme() async {
    var prefs = await Hive.openBox('Storage');
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return prefs.get(THEME_STATUS) ?? isDarkMode;
  }

  Future<String> getColor() async {
    var prefs = await Hive.openBox('Storage');
    return prefs.get(COLOR_STATUS) ?? 'Purple';
  }

  Future<int> getSelected() async {
    var prefs = await Hive.openBox('Storage');
    return prefs.get(SELECTED_STATUS) ?? 0;
  }

  Future<String> getGradientImageUrl() async {
    var prefs = await Hive.openBox('Storage');
    return prefs.get(GRADIENT_IMAGE_STATUS) ?? './assets/Purple_gradient_1.png';
  }
}
