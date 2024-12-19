import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thrivve_flutter_assignment/core/utils/enums.dart';
import 'package:thrivve_flutter_assignment/main.dart';

class SpHelper {
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences sp = getIt.get();
  setLanguage(Language language) {
    sp.setString('language', language == Language.ar ? 'ar' : 'en');
  }

  Language getLanguage() {
    String? x = sp.getString('language') ?? 'en';
    Language language = x == 'ar' ? Language.ar : Language.en;
    return language;
  }
}
