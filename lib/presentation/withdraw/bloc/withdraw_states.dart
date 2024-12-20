import 'package:flutter/material.dart';
import 'package:thrivve_flutter_assignment/core/presentation/widgets/shaking_widget.dart';
import 'package:thrivve_flutter_assignment/data/models/payment_method.dart';
import 'package:thrivve_flutter_assignment/data/models/withdraw_response.dart';

abstract class WithdrawState {
  final List<PaymentMethodModel> paymentMethods;
  final List<int> choises;
  final int selectedChoise;
  final PaymentMethodModel? selectedPaymentMethod;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final int balance;
  const WithdrawState(
      {required this.paymentMethods,
      required this.choises,
      required this.textEditingController,
      required this.focusNode,
      required this.balance,
      required this.selectedChoise,
      this.selectedPaymentMethod});
}

class WithdrawInitialState extends WithdrawState {
  const WithdrawInitialState(
      {super.paymentMethods = const [],
      super.choises = const [],
      required super.textEditingController,
      required super.focusNode,
      required super.balance,
      required super.selectedChoise});
}

class WithdrawLoadingState extends WithdrawState {
  const WithdrawLoadingState(
      {required super.paymentMethods,
      required super.choises,
      super.selectedPaymentMethod,
      required super.textEditingController,
      required super.focusNode,
      required super.balance,
      required super.selectedChoise});
}

class WithdrawPageLoadedState extends WithdrawState {
  final TextEditingController withdrawTextEditingController;

  const WithdrawPageLoadedState(
      {required super.paymentMethods,
      required super.choises,
      required this.withdrawTextEditingController,
      super.selectedPaymentMethod,
      required super.textEditingController,
      required super.focusNode,
      required super.balance,
      required super.selectedChoise});
}

class WithdrawPaymentMthodsLoadedState extends WithdrawState {
  final TextEditingController withdrawTextEditingController;
  const WithdrawPaymentMthodsLoadedState(
      {required super.paymentMethods,
      required super.choises,
      required this.withdrawTextEditingController,
      super.selectedPaymentMethod,
      required super.textEditingController,
      required super.focusNode,
      required super.balance,
      required super.selectedChoise});
}

class WithdrawSuccessState extends WithdrawState {
  final WithdrawResponse withdrawResponse;
  const WithdrawSuccessState(
      {required super.paymentMethods,
      required super.choises,
      required this.withdrawResponse,
      super.selectedPaymentMethod,
      required super.textEditingController,
      required super.focusNode,
      required super.balance,
      required super.selectedChoise});
}

class MakeWithdrawLoadingState extends WithdrawState {
  const MakeWithdrawLoadingState(
      {required super.paymentMethods,
      required super.choises,
      super.selectedPaymentMethod,
      required super.textEditingController,
      required super.focusNode,
      required super.balance,
      required super.selectedChoise});
}

class WithdrawSelectPaymentMethodState extends WithdrawState {
  const WithdrawSelectPaymentMethodState(
      {required super.paymentMethods,
      required super.choises,
      super.selectedPaymentMethod,
      required super.textEditingController,
      required super.focusNode,
      required super.balance,
      required super.selectedChoise});
}

class WithdrawSelectChoiseState extends WithdrawState {
  const WithdrawSelectChoiseState(
      {required super.paymentMethods,
      required super.choises,
      super.selectedPaymentMethod,
      required super.textEditingController,
      required super.focusNode,
      required super.balance,
      required super.selectedChoise});
}

class WithdrawErrorState extends WithdrawState {
  const WithdrawErrorState(
      {required super.paymentMethods,
      required super.choises,
      super.selectedPaymentMethod,
      required super.textEditingController,
      required super.focusNode,
      required super.balance,
      required super.selectedChoise});
}
