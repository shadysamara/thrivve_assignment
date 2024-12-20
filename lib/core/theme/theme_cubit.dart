import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrivve_flutter_assignment/core/utils/sharedprefrences_helper.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(SpHelper.spHelper.themeMode);

  void changeMode(ThemeMode mode) {
    emit(mode);
    SpHelper.spHelper.setThemeMode(mode);
  }

  bool isLightMode(BuildContext context) {
    if (state == ThemeMode.system) {
      return MediaQuery.of(context).platformBrightness == Brightness.light;
    }

    return state == ThemeMode.light;
  }
}
