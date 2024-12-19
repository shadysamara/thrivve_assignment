import 'package:get/get.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/screens/withdraw_main_screen.dart';

class GetPages {
  static List<GetPage<dynamic>>? getPages = [
    GetPage(name: '/', page: () => WithdrawMainScreen()),
  ];
}
