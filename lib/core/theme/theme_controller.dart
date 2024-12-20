import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrivve_flutter_assignment/core/utils/sharedprefrences_helper.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;
  changeTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    update();

    bool isDark = themeMode.value == ThemeMode.dark ? true : false;
    SpHelper.spHelper.saveTheme(isDark);
  }

  getTheme() {
    themeMode.value = SpHelper.spHelper.getTheme();
  }
}