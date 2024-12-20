import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:thrivve_flutter_assignment/core/routes/routes_pages.dart';
import 'package:thrivve_flutter_assignment/core/theme/dark_theme.dart';
import 'package:thrivve_flutter_assignment/core/theme/light_theme.dart';
import 'package:thrivve_flutter_assignment/core/theme/theme_cubit.dart';
import 'package:thrivve_flutter_assignment/core/translations/localization_cubit.dart';
import 'package:thrivve_flutter_assignment/core/translations/localization_service.dart';
import '../injection_container.dart' as di;
import 'package:thrivve_flutter_assignment/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.getIt<LocalizationCubit>()),
        BlocProvider(create: (context) => di.getIt<ThemeCubit>()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 811),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (themeContext, themeMode) {
              return BlocBuilder<LocalizationCubit, Locale>(
                  builder: (context, locale) {
                return GetMaterialApp(
                  locale: locale,
                  fallbackLocale: LocalizationService.fallbackLocale,
                  translations: LocalizationService(),
                  debugShowCheckedModeBanner: false,
                  getPages: GetPages.getPages,
                  themeMode: themeMode,
                  darkTheme: darkTheme,
                  theme: lightTheme,
                );
              });
            });
          }),
    );
  }
}
