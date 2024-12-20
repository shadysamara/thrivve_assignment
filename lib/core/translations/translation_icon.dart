import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:thrivve_flutter_assignment/core/translations/localization_service.dart';
import 'package:thrivve_flutter_assignment/core/utils/assets_manager.dart';
import 'package:thrivve_flutter_assignment/core/utils/enums.dart';

class TranslationIcon extends StatelessWidget {
  final LocalizationService localizationService;
  const TranslationIcon(
    this.localizationService, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        localizationService.changeLocale((Get.locale == const Locale("ar", "SA")
            ? Language.en
            : Language.ar));
        // context.read<LocalizationCubit>().changeLanguage();
      },
      child: LottieBuilder.asset(
        JsonAssets.languageJson,
      ),
    );
  }
}
