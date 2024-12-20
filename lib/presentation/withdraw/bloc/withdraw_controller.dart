import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrivve_flutter_assignment/core/presentation/widgets/shaking_widget.dart';
import 'package:thrivve_flutter_assignment/core/routes/routes_names.dart';
import 'package:thrivve_flutter_assignment/data/models/payment_method.dart';
import 'package:thrivve_flutter_assignment/data/models/withdraw_response.dart';
import 'package:thrivve_flutter_assignment/data/repositories/withdraw_repository.dart';

class WithdrawController extends GetxController {
  WithdrawApiRepository withdrawApiRepository;
  double balance = 0;
  WithdrawController(this.withdrawApiRepository, this.balance);

  // this varables id for the balance textfirld that appears in the withdrawal main screen
  TextEditingController withdrawTextEditingController = TextEditingController();
  FocusNode withdrawTextFieldFocusNode = FocusNode();

  // this part will be excuted everytime the user press on any balance choises
  RxInt selectedChoiseValue = 0.obs;
  setWithdrawbasedOnChoise(int value) {
    selectedChoiseValue.value = value;
    withdrawTextEditingController.text = value.toString();
  }

  // this part is for choises tabs in the withdrawal main screen
  // it will be excuted one tome after initialize the controller
  RxList<int> choices = RxList<int>();
  getChoises() {
    if (choices.isEmpty) {
      double initInterval = ((balance - 50) / 3);
      double fifteenMultpliationInterval = initInterval - (initInterval % 50);
      double firstMiddle = 50 + fifteenMultpliationInterval;
      double secondMiddle = firstMiddle + fifteenMultpliationInterval;
      choices.addAll(
          [50, firstMiddle.toInt(), secondMiddle.toInt(), balance.toInt()]);
    }
  }

// this part is for bottomsheet where the payment methods are displayes and the user can choose any one from them
  List<PaymentMethodModel> paymentMethods = [];
  getAllPaymentMethods() async {
    List<PaymentMethodModel> paymentMethods =
        await withdrawApiRepository.getPaymentMethods();
    this.paymentMethods = paymentMethods;
    update();
  }

// this part will be excuted when the user select any payment method from the bottomsheet
  Rx<PaymentMethodModel?> selectedPaymentMethod = Rx<PaymentMethodModel?>(null);
  selectPaymentMethod(PaymentMethodModel? selectedPaymentMethod) {
    this.selectedPaymentMethod.value = selectedPaymentMethod;
  }

// this part is for make withdraw where it will be excute after pressing on the continue button
  RxBool isLoading = false.obs;
  final GlobalKey<ShakeWidgetState> shakeWidgetKey =
      GlobalKey<ShakeWidgetState>();
  makeWithdraw() async {
    if (isLoading.value == false) {}
    if (withdrawTextEditingController.text == "") {
      shakeWidgetKey.currentState?.startShake();
      return;
    } else {
      isLoading.value = true;
      WithdrawResponse withdrawResponse =
          await withdrawApiRepository.makeWithdraw();

      Get.offNamed(Routenames.withdrawSuccess, arguments: withdrawResponse);
      // isLoading.value = false;
    }
  }

// this method is built in dunction inside the getxcontroller
// this method will be excuted one time when  the controller is
  @override
  void onInit() {
    super.onInit();
    getAllPaymentMethods();
    getChoises();
  }
}
