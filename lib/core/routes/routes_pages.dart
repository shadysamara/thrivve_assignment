import 'package:get/get.dart';
import 'package:thrivve_flutter_assignment/core/routes/routes_names.dart';
import 'package:thrivve_flutter_assignment/data/models/withdraw_response.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/screens/success_withdraw.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/screens/withdraw_main_screen.dart';

class GetPages {
  static List<GetPage<dynamic>>? getPages = [
    GetPage(
        name: Routenames.withdrawMainPage,
        page: () => const WithdrawMainScreen()),
    GetPage(
        name: Routenames.withdrawSuccess,
        page: () => SuccessWithdrawalScreen(Get.arguments as WithdrawResponse)),
  ];
}
