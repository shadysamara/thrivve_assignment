import 'package:flutter/material.dart';
import 'package:thrivve_flutter_assignment/core/presentation/widgets/shaking_widget.dart';
import 'package:thrivve_flutter_assignment/data/models/payment_method.dart';

abstract class WithdrawEvent {}

class LoadWithdrawPageEvent extends WithdrawEvent {
  double balance;
  LoadWithdrawPageEvent(this.balance);
}

class SelectWithdrawPaymentMethodEvent extends WithdrawEvent {
  PaymentMethodModel paymentMethodModel;
  SelectWithdrawPaymentMethodEvent(this.paymentMethodModel);
}

class MakeWithdrawEvent extends WithdrawEvent {
  PaymentMethodModel paymentMethodModel;
  TextEditingController withdrawTextEditingController;
  GlobalKey<ShakeWidgetState> shakeWidgetKey;
  MakeWithdrawEvent(this.paymentMethodModel, this.shakeWidgetKey,
      this.withdrawTextEditingController);
}

class SelectBalanceChoise extends WithdrawEvent {
  int value;
  SelectBalanceChoise(this.value);
}
