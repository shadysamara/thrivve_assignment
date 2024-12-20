import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thrivve_flutter_assignment/core/routes/routes_names.dart';
import 'package:thrivve_flutter_assignment/data/models/payment_method.dart';
import 'package:thrivve_flutter_assignment/data/models/withdraw_response.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_controller.dart';

import 'data.dart';
import 'mocks.dart'; // Import the mocks file

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late WithdrawController withdrawController;
  late MockWithdrawApiRepository mockWithdrawApiRepository;
  late MockGet mockGet;

  setUpAll(() {
    Get.testMode = true;
    mockWithdrawApiRepository = MockWithdrawApiRepository();
    withdrawController = WithdrawController(mockWithdrawApiRepository, 350.0);
    mockGet = MockGet();
  });

  group('WithdrawController Tests', () {
    test('Initial values are set correctly', () {
      expect(withdrawController.balance, 350.0);
      expect(withdrawController.selectedChoiseValue.value, 0);
      expect(withdrawController.choices.isEmpty, true);
    });

    test('setWithdrawbasedOnChoise updates the value correctly', () {
      withdrawController.setWithdrawbasedOnChoise(200);
      expect(withdrawController.selectedChoiseValue.value, 200);
      expect(withdrawController.withdrawTextEditingController.text, '200');
    });

    test('getChoises calculates choices correctly', () {
      withdrawController.getChoises();
      expect(withdrawController.choices.length, 4);
      expect(withdrawController.choices[0], 50);
      expect(withdrawController.choices[1], 150);
      expect(withdrawController.choices[2], 250);
      expect(withdrawController.choices[3], 350);
    });
  });
  test(
      'getAllPaymentMethods calls the API and updates the payment methods list',
      () async {
    final mockPaymentMethods =
        mockResponseJson.map((e) => PaymentMethodModel.fromJson(e)).toList();
    when(() => mockWithdrawApiRepository.getPaymentMethods())
        .thenAnswer((_) async => mockPaymentMethods);

    await withdrawController.getAllPaymentMethods();

    expect(withdrawController.paymentMethods.length, 2);
    expect(withdrawController.paymentMethods[0].bankName, 'Al Rajhi');
    expect(withdrawController.paymentMethods[1].bankName, 'Al Arabi');

    expect(withdrawController.paymentMethods[0].bankId, 4);
    expect(withdrawController.paymentMethods[1].bankId, 4);

    expect(withdrawController.paymentMethods[0].status, 'In-Review');
    expect(withdrawController.paymentMethods[1].status, isNull);

    expect(withdrawController.paymentMethods[0].beneficiaryIban,
        'GB29NWBK60161331926819');
    expect(withdrawController.paymentMethods[1].beneficiaryIban,
        'AR29NWBK60161331926820');
  });

  test('selectPaymentMethod updates the selected payment method', () {
    final paymentMethod = PaymentMethodModel.fromJson(mockResponseJson.first);
    withdrawController.selectPaymentMethod(paymentMethod);
    expect(withdrawController.selectedPaymentMethod.value, paymentMethod);
  });

  test('makeWithdraw handles successful withdrawal', () async {
    when(() => mockWithdrawApiRepository.makeWithdraw()).thenAnswer((_) async {
      await Future.delayed(const Duration(seconds: 1)); // Simulate some delay
      return WithdrawResponse(
          title: "success", message: 'Withdrawal Successful');
    });

    when(() => mockGet.offNamed(any())).thenAnswer((_) async {});

    withdrawController.withdrawTextEditingController.text = "100";

    Future response = withdrawController.makeWithdraw();

    expect(withdrawController.isLoading.value, true);

    await response;

    expect(withdrawController.isLoading.value, false);
  });

  test('makeWithdraw handles empty withdrawal text input', () async {
    withdrawController.withdrawTextEditingController.text = '';

    await withdrawController.makeWithdraw();
    expect(withdrawController.isLoading.value, false);
  });
}
