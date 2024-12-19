import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrivve_flutter_assignment/core/translations/ar_sa.dart';
import 'package:thrivve_flutter_assignment/core/translations/en_us.dart';
import 'package:thrivve_flutter_assignment/core/utils/enums.dart';
import 'package:thrivve_flutter_assignment/core/utils/sharedprefrences_helper.dart';

class LocalizationService extends Translations {
  static setLocale(Language lan) {
    SpHelper.spHelper.setLanguage(lan);
  }

  static Locale getSavedLocal() {
    Language lan = SpHelper.spHelper.getLanguage();
    if (lan == Language.ar) {
      return const Locale('ar', 'SA');
    } else {
      return const Locale('en', 'US');
    }
  }

  static const fallbackLocale = Locale('en', 'US');

  static final langs = ['English', 'Arabic'];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('ar', 'SA'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // lang/en_us.dart
        'ar_SA': arSA, // lang/tr_tr.dart
      };

  static changeLocale(Language lan) {
    Locale locale;
    if (lan == Language.ar) {
      locale = const Locale('ar', 'SA');
    } else {
      locale = const Locale('en', 'US');
    }
    setLocale(lan);
    Get.updateLocale(locale);
  }
}
