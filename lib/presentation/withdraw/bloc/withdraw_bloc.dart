import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrivve_flutter_assignment/core/presentation/widgets/shaking_widget.dart';
import 'package:thrivve_flutter_assignment/data/models/payment_method.dart';
import 'package:thrivve_flutter_assignment/data/models/withdraw_response.dart';
import 'package:thrivve_flutter_assignment/data/repositories/withdraw_repository.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_events.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_states.dart';

class WithdrawBloc extends Bloc<WithdrawEvent, WithdrawState> {
  WithdrawApiRepository withdrawApiRepository;
  WithdrawBloc(this.withdrawApiRepository)
      : super(const WithdrawInitialState()) {
    on<LoadWithdrawPageEvent>(_onLoadWithdrawPageMethod);
    on<SelectWithdrawPaymentMethodEvent>(_onSelectPaymentMethod);
    on<MakeWithdrawEvent>(_onMakeWithdrawEvent);
    on<SelectBalanceChoise>(_onSelectBalanceEvent);
  }
  List<PaymentMethodModel> paymentMethods = [];
  List<int> choices = [];
  _onLoadWithdrawPageMethod(
      LoadWithdrawPageEvent event, Emitter<WithdrawState> emit) async {
    emit(WithdrawLoadingState(
        choises: state.choises, paymentMethods: state.paymentMethods));
    choices = getChoises(event.balance);
    Future<List<PaymentMethodModel>> paymentMethodsInFuture =
        getAllPaymentMethods();
    emit(WithdrawPageLoadedState(
        choises: choices,
        paymentMethods: [],
        withdrawTextEditingController: withdrawTextEditingController));
    paymentMethods = await paymentMethodsInFuture;
    emit(WithdrawPaymentMthodsLoadedState(
        choises: choices,
        paymentMethods: paymentMethods,
        withdrawTextEditingController: withdrawTextEditingController));
  }

  _onSelectPaymentMethod(
      SelectWithdrawPaymentMethodEvent event, Emitter<WithdrawState> emit) {
    emit(WithdrawPaymentMthodsLoadedState(
        choises: choices,
        paymentMethods: paymentMethods,
        selectedPaymentMethod: event.paymentMethodModel,
        withdrawTextEditingController: withdrawTextEditingController));
  }

  _onMakeWithdrawEvent(
      MakeWithdrawEvent event, Emitter<WithdrawState> emit) async {
    if (withdrawTextEditingController.text == "") {
      event.shakeWidgetKey.currentState?.startShake();
    } else {
      emit(MakeWithdrawLoadingState(
        choises: choices,
        paymentMethods: paymentMethods,
        selectedPaymentMethod: event.paymentMethodModel,
      ));
      emit(MakeWithdrawLoadingState(
        choises: choices,
        paymentMethods: paymentMethods,
        selectedPaymentMethod: event.paymentMethodModel,
      ));
      WithdrawResponse? withdrawResponse =
          await makeWithdraw(event.shakeWidgetKey);

      emit(WithdrawSuccessState(
          choises: choices,
          paymentMethods: paymentMethods,
          selectedPaymentMethod: event.paymentMethodModel,
          withdrawResponse: withdrawResponse!));
    }
  }

  _onSelectBalanceEvent(
      SelectBalanceChoise event, Emitter<WithdrawState> emit) {}
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

  TextEditingController withdrawTextEditingController = TextEditingController();
}
