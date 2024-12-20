import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thrivve_flutter_assignment/core/network/dio_consumer.dart';
import 'package:thrivve_flutter_assignment/core/theme/theme_controller.dart';
import 'package:thrivve_flutter_assignment/core/translations/localization_service.dart';
import 'package:thrivve_flutter_assignment/core/utils/sharedprefrences_helper.dart';
import 'package:thrivve_flutter_assignment/data/data_sources/withdraw_source_api.dart';
import 'package:thrivve_flutter_assignment/data/repositories/withdraw_repository.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await initSettingsAndDio();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.registerSingleton<SpHelper>(SpHelper(getIt.get()));
  getIt
      .registerSingleton<LocalizationService>(LocalizationService(getIt.get()));

  getIt
      .registerSingleton<ThemeController>(ThemeController(getIt.get()))
      .getTheme();

  getIt
      .registerSingleton<WithdrawApiProvider>(WithdrawApiProvider(getIt.get()));
  getIt.registerSingleton<WithdrawApiRepository>(
      WithdrawApiRepository(getIt.get()));
}
