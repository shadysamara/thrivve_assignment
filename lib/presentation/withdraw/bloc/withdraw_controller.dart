import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrivve_flutter_assignment/data/models/payment_method.dart';

class WithdrawController extends GetxController {
  PaymentMethodModel? selectedPaymentMethod;
  selectPaymentMethod(PaymentMethodModel? selectedPaymentMethod) {
    this.selectedPaymentMethod = selectedPaymentMethod;
    update(["selected_payment_method"]);
  }

  TextEditingController withdrawTextEditingController = TextEditingController();
  double balance = 400;
  FocusNode withdrawTextFieldFocusNode = FocusNode();
  List<int> getChoises() {
    double initInterval = ((balance - 50) / 3);
    double fifteenMultpliationInterval = initInterval - (initInterval % 50);
    double firstMiddle = 50 + fifteenMultpliationInterval;
    double secondMiddle = firstMiddle + fifteenMultpliationInterval;
    return [50, firstMiddle.toInt(), secondMiddle.toInt(), balance.toInt()];
  }
}
