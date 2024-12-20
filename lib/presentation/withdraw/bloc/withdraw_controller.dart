import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrivve_flutter_assignment/core/presentation/widgets/shaking_widget.dart';
import 'package:thrivve_flutter_assignment/data/models/payment_method.dart';
import 'package:thrivve_flutter_assignment/data/models/withdraw_response.dart';
import 'package:thrivve_flutter_assignment/data/repositories/withdraw_repository.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/screens/success_withdraw.dart';

class WithdrawController extends GetxController {
  WithdrawApiRepository withdrawApiRepository;
  WithdrawController(this.withdrawApiRepository);
  PaymentMethodModel? selectedPaymentMethod;
  selectPaymentMethod(PaymentMethodModel? selectedPaymentMethod) {
    this.selectedPaymentMethod = selectedPaymentMethod;
    update();
  }

  TextEditingController withdrawTextEditingController = TextEditingController();
  double balance = 400;
  FocusNode withdrawTextFieldFocusNode = FocusNode();
  RxInt selectedChoiseValue = 0.obs;
  setWithdrawbasedOnChoise(int value) {
    selectedChoiseValue.value = value;
    withdrawTextEditingController.text = value.toString();
  }

  List<int> getChoises() {
    double initInterval = ((balance - 50) / 3);
    double fifteenMultpliationInterval = initInterval - (initInterval % 50);
    double firstMiddle = 50 + fifteenMultpliationInterval;
    double secondMiddle = firstMiddle + fifteenMultpliationInterval;
    return [50, firstMiddle.toInt(), secondMiddle.toInt(), balance.toInt()];
  }

  List<PaymentMethodModel> paymentMethods = [];
  getAllPaymentMethods() async {
    List<PaymentMethodModel> paymentMethods =
        await withdrawApiRepository.getPaymentMethods();
    this.paymentMethods = paymentMethods;
    update();
  }

  RxBool isLoading = false.obs;
  final GlobalKey<ShakeWidgetState> shakeWidgetKey =
      GlobalKey<ShakeWidgetState>();
  makeWithdraw(BuildContext context) async {
    if (withdrawTextEditingController.text == "") {
      shakeWidgetKey.currentState?.startShake();
    } else {
      isLoading.value = true;
      WithdrawResponse withdrawResponse =
          await withdrawApiRepository.makeWithdraw();
      isLoading.value = false;
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return SuccessWithdrawalScreen(withdrawResponse);
      }));
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllPaymentMethods();
  }
}
