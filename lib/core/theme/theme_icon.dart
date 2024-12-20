import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:thrivve_flutter_assignment/core/theme/theme_controller.dart';
import 'package:thrivve_flutter_assignment/core/utils/assets_manager.dart';
import 'package:thrivve_flutter_assignment/injection_container.dart' as di;

class ThemeIcon extends StatelessWidget {
  const ThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        di.getIt.get<ThemeController>().changeTheme();
      },
      child: Obx(() {
        return di.getIt.get<ThemeController>().themeMode.value ==
                ThemeMode.light
            ? LottieBuilder.asset(JsonAssets.moonJson)
            : LottieBuilder.asset(JsonAssets.sunJson);
      }),
    );
  }
}
