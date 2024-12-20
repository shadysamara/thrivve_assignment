import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrivve_flutter_assignment/core/translations/localization_service.dart';
import 'package:thrivve_flutter_assignment/core/utils/enums.dart';
import 'package:thrivve_flutter_assignment/core/utils/sharedprefrences_helper.dart';

class LocalizationCubit extends Cubit<Locale> {
  LocalizationCubit() : super(LocalizationService.getSavedLocal());

  void changeLanguage() {
    Language languag =
        state == const Locale('ar', 'SA') ? Language.en : Language.ar;

    LocalizationService.changeLocale(languag);
    if (languag == Language.ar) {
      emit(const Locale('ar', 'SA'));
    } else {
      emit(const Locale('en', 'US'));
    }
  }
}
