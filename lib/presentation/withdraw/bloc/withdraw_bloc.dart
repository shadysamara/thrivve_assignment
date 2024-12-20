import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrivve_flutter_assignment/core/presentation/widgets/shaking_widget.dart';
import 'package:thrivve_flutter_assignment/data/models/payment_method.dart';
import 'package:thrivve_flutter_assignment/data/models/withdraw_response.dart';
import 'package:thrivve_flutter_assignment/data/repositories/withdraw_repository.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_events.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_states.dart';

class WithdrawBloc extends Bloc<WithdrawEvent, WithdrawState> {
  final WithdrawApiRepository withdrawApiRepository;
  final int balance;

  late final FocusNode focusNode;
  late final TextEditingController withdrawTextEditingController;

  WithdrawBloc(this.withdrawApiRepository, this.balance, this.focusNode,
      this.withdrawTextEditingController)
      : super(WithdrawInitialState(
            balance: balance,
            focusNode: focusNode,
            textEditingController: withdrawTextEditingController,
            choises: [],
            paymentMethods: [],
            selectedChoise: 0)) {
    on<LoadWithdrawPageEvent>(_onLoadWithdrawPageMethod);
    on<SelectWithdrawPaymentMethodEvent>(_onSelectPaymentMethod);
    on<MakeWithdrawEvent>(_onMakeWithdrawEvent);
    on<SelectBalanceChoise>(_onSelectBalanceEvent);
  }
  List<PaymentMethodModel> paymentMethods = [];
  List<int> choices = [];
  _onLoadWithdrawPageMethod(
      LoadWithdrawPageEvent event, Emitter<WithdrawState> emit) async {
    choices = getChoises(event.balance);
    emit(WithdrawLoadingState(
        choises: choices,
        paymentMethods: [],
        balance: balance,
        focusNode: focusNode,
        textEditingController: withdrawTextEditingController,
        selectedPaymentMethod: null,
        selectedChoise: selectedChoise));

    Future<List<PaymentMethodModel>> paymentMethodsInFuture =
        getAllPaymentMethods();

    paymentMethods = await paymentMethodsInFuture;
    emit(WithdrawPaymentMthodsLoadedState(
        selectedPaymentMethod: null,
        choises: choices,
        paymentMethods: paymentMethods,
        withdrawTextEditingController: withdrawTextEditingController,
        textEditingController: withdrawTextEditingController,
        focusNode: focusNode,
        selectedChoise: selectedChoise,
        balance: balance));
  }

  late PaymentMethodModel? selectedPaymentMethod;
  _onSelectPaymentMethod(
      SelectWithdrawPaymentMethodEvent event, Emitter<WithdrawState> emit) {
    emit(WithdrawLoadingState(
        choises: choices,
        paymentMethods: paymentMethods,
        balance: balance,
        focusNode: focusNode,
        textEditingController: withdrawTextEditingController,
        selectedPaymentMethod: event.paymentMethodModel,
        selectedChoise: selectedChoise));
    selectedPaymentMethod = event.paymentMethodModel;
    emit(WithdrawPaymentMthodsLoadedState(
        selectedPaymentMethod: event.paymentMethodModel,
        choises: choices,
        paymentMethods: paymentMethods,
        withdrawTextEditingController: withdrawTextEditingController,
        textEditingController: withdrawTextEditingController,
        focusNode: focusNode,
        selectedChoise: selectedChoise,
        balance: balance));
  }

  _onMakeWithdrawEvent(
      MakeWithdrawEvent event, Emitter<WithdrawState> emit) async {
    if (withdrawTextEditingController.text == "") {
      event.shakeWidgetKey.currentState?.startShake();
    } else {
      emit(MakeWithdrawLoadingState(
          selectedPaymentMethod: selectedPaymentMethod,
          choises: choices,
          paymentMethods: paymentMethods,
          textEditingController: withdrawTextEditingController,
          focusNode: focusNode,
          balance: balance,
          selectedChoise: selectedChoise));

      WithdrawResponse? withdrawResponse =
          await makeWithdraw(event.shakeWidgetKey);

      emit(WithdrawSuccessState(
          choises: choices,
          paymentMethods: paymentMethods,
          selectedPaymentMethod: selectedPaymentMethod,
          withdrawResponse: withdrawResponse!,
          textEditingController: withdrawTextEditingController,
          focusNode: focusNode,
          balance: balance,
          selectedChoise: selectedChoise));
    }
  }

  int selectedChoise = 0;
  _onSelectBalanceEvent(
      SelectBalanceChoise event, Emitter<WithdrawState> emit) {
    selectedChoise = event.value;
    withdrawTextEditingController.text = event.value.toString();
    emit(WithdrawPageLoadedState(
        choises: choices,
        paymentMethods: paymentMethods,
        selectedPaymentMethod: selectedPaymentMethod,
        textEditingController: withdrawTextEditingController,
        focusNode: focusNode,
        balance: balance,
        withdrawTextEditingController: withdrawTextEditingController,
        selectedChoise: selectedChoise));
  }

  Future<List<PaymentMethodModel>> getAllPaymentMethods() async {
    List<PaymentMethodModel> paymentMethods =
        await withdrawApiRepository.getPaymentMethods();
    return paymentMethods;
  }

  List<int> getChoises(double balance) {
    double initInterval = ((balance - 50) / 3);
    double fifteenMultpliationInterval = initInterval - (initInterval % 50);
    double firstMiddle = 50 + fifteenMultpliationInterval;
    double secondMiddle = firstMiddle + fifteenMultpliationInterval;
    return [50, firstMiddle.toInt(), secondMiddle.toInt(), balance.toInt()];
  }

  Future<WithdrawResponse?> makeWithdraw(
      GlobalKey<ShakeWidgetState> shakeWidgetKey) async {
    if (withdrawTextEditingController.text == "") {
      shakeWidgetKey.currentState?.startShake();
      return null;
    } else {
      WithdrawResponse withdrawResponse =
          await withdrawApiRepository.makeWithdraw();
      return withdrawResponse;
    }
  }
}
