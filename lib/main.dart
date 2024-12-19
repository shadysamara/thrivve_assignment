import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thrivve_flutter_assignment/core/network/dio_consumer.dart';
import 'package:thrivve_flutter_assignment/core/routes/routes_pages.dart';
import 'package:thrivve_flutter_assignment/core/theme/dark_theme.dart';
import 'package:thrivve_flutter_assignment/core/theme/light_theme.dart';
import 'package:thrivve_flutter_assignment/core/translations/localization_service.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await initSettingsAndDio();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: const Size(375, 811),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            locale: LocalizationService.getSavedLocal(),
            fallbackLocale: LocalizationService.fallbackLocale,
            translations: LocalizationService(),
            debugShowCheckedModeBanner: false,
            getPages: GetPages.getPages,
            themeMode: ThemeMode.light,
            darkTheme: darkTheme,
            theme: lightTheme,
          );
        });
  }
}
