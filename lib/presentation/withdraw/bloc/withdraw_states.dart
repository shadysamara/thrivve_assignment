import 'package:flutter/material.dart';
import 'package:thrivve_flutter_assignment/data/models/payment_method.dart';
import 'package:thrivve_flutter_assignment/data/models/withdraw_response.dart';

abstract class WithdrawState {
  final List<PaymentMethodModel> paymentMethods;
  final List<int> choises;
  final PaymentMethodModel? selectedPaymentMethod;
  const WithdrawState(
      {required this.paymentMethods,
      required this.choises,
      this.selectedPaymentMethod});
}

class WithdrawInitialState extends WithdrawState {
  const WithdrawInitialState(
      {super.paymentMethods = const [], super.choises = const []});
}

class WithdrawLoadingState extends WithdrawState {
  const WithdrawLoadingState(
      {required super.paymentMethods,
      required super.choises,
      super.selectedPaymentMethod});
}

class WithdrawPageLoadedState extends WithdrawState {
  final TextEditingController withdrawTextEditingController;

  const WithdrawPageLoadedState(
      {required super.paymentMethods,
      required super.choises,
      required this.withdrawTextEditingController,
      super.selectedPaymentMethod});
}

class WithdrawPaymentMthodsLoadedState extends WithdrawState {
  final TextEditingController withdrawTextEditingController;
  const WithdrawPaymentMthodsLoadedState(
      {required super.paymentMethods,
      required super.choises,
      required this.withdrawTextEditingController,
      super.selectedPaymentMethod});
}

class WithdrawSuccessState extends WithdrawState {
  final WithdrawResponse withdrawResponse;
  const WithdrawSuccessState(
      {required super.paymentMethods,
      required super.choises,
      required this.withdrawResponse,
      super.selectedPaymentMethod});
}

class MakeWithdrawLoadingState extends WithdrawState {
  const MakeWithdrawLoadingState(
      {required super.paymentMethods,
      required super.choises,
      super.selectedPaymentMethod});
}

class WithdrawSelectPaymentMethodState extends WithdrawState {
  const WithdrawSelectPaymentMethodState(
      {required super.paymentMethods,
      required super.choises,
      super.selectedPaymentMethod});
}

class WithdrawSelectChoiseState extends WithdrawState {
  const WithdrawSelectChoiseState(
      {required super.paymentMethods,
      required super.choises,
      super.selectedPaymentMethod});
}

class WithdrawErrorState extends WithdrawState {
  const WithdrawErrorState(
      {required super.paymentMethods,
      required super.choises,
      super.selectedPaymentMethod});
}
