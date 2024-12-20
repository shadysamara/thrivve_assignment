import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thrivve_flutter_assignment/core/utils/enums.dart';
import 'package:thrivve_flutter_assignment/injection_container.dart' as di;

class SpHelper {
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences sp = di.getIt.get();
  setLanguage(Language language) {
    sp.setString('language', language == Language.ar ? 'ar' : 'en');
  }

  Language getLanguage() {
    String? x = sp.getString('language') ?? 'en';
    Language language = x == 'ar' ? Language.ar : Language.en;
    return language;
  }

  void setThemeMode(ThemeMode mode) {
    sp.setInt('themeMode', mode.index);
  }

  ThemeMode get themeMode => ThemeMode.values[sp.getInt('themeMode') ?? 0];
}
