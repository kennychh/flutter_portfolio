import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";
  static const COLOR_STATUS = "COLORSTATUS";
  static const SELECTED_STATUS = "SELECTEDSTATUS";
  static const GRADIENT_IMAGE_STATUS = "GRADIENTIMAGESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  setColor(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(COLOR_STATUS, value);
  }

  setSelected(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(SELECTED_STATUS, value);
  }

  setGradientImageUrl(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(GRADIENT_IMAGE_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return prefs.getBool(THEME_STATUS) ?? isDarkMode;
  }

  Future<String> getColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(COLOR_STATUS) ?? 'purple';
  }

  Future<int> getSelected() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(SELECTED_STATUS) ?? 0;
  }

  Future<String> getGradientImageUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(GRADIENT_IMAGE_STATUS) ??
        './assets/purple_gradient.png';
  }
}
