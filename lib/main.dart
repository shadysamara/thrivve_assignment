import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:thrivve_flutter_assignment/core/routes/routes_pages.dart';
import 'package:thrivve_flutter_assignment/core/theme/dark_theme.dart';
import 'package:thrivve_flutter_assignment/core/theme/light_theme.dart';
import 'package:thrivve_flutter_assignment/core/theme/theme_controller.dart';
import 'package:thrivve_flutter_assignment/core/translations/localization_service.dart';
import 'package:thrivve_flutter_assignment/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await init();
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
          return Obx(() {
            return GetMaterialApp(
              locale: getIt.get<LocalizationService>().getSavedLocal(),
              fallbackLocale: LocalizationService.fallbackLocale,
              translations: getIt.get<LocalizationService>(),
              debugShowCheckedModeBanner: false,
              getPages: GetPages.getPages,
              themeMode: getIt.get<ThemeController>().themeMode.value,
              darkTheme: darkTheme,
              theme: lightTheme,
            );
          });
        });
  }
}
