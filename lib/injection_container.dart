import 'package:shared_preferences/shared_preferences.dart';
import 'package:thrivve_flutter_assignment/core/network/dio_consumer.dart';
import 'package:thrivve_flutter_assignment/data/data_sources/withdraw_source_api.dart';
import 'package:thrivve_flutter_assignment/data/repositories/withdraw_repository.dart';
import 'package:thrivve_flutter_assignment/main.dart';

Future<void> init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await initSettingsAndDio();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt
      .registerSingleton<WithdrawApiProvider>(WithdrawApiProvider(getIt.get()));
  getIt.registerSingleton<WithdrawApiRepository>(
      WithdrawApiRepository(getIt.get()));
}
