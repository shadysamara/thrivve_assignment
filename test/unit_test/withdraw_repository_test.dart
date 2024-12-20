import 'package:flutter_test/flutter_test.dart';
import 'package:thrivve_flutter_assignment/data/models/payment_method.dart';
import 'package:thrivve_flutter_assignment/data/repositories/withdraw_repository.dart';
import 'package:thrivve_flutter_assignment/data/data_sources/withdraw_source_api.dart';
import 'package:mocktail/mocktail.dart';
import 'data.dart';
import 'mocks.dart'; // Import the mocks file

void main() {
  late MockApiProvider mockApiProvider;
  late WithdrawApiRepository withdrawApiRepository;

  setUpAll(() {
    mockApiProvider = MockApiProvider();
    withdrawApiRepository = WithdrawApiRepository(mockApiProvider);
  });

  group('WithdrawApiRepository Tests', () {
    test('getPaymentMethods should correctly deserialize the JSON response',
        () async {
      // Arrange: mock the API call to return the mock JSON response
      when(() => mockApiProvider.getPaymentMethods())
          .thenAnswer((_) async => mockResponseJson);

      // Act: call the method that fetches the payment methods
      final List<PaymentMethodModel> paymentMethods =
          await withdrawApiRepository.getPaymentMethods();

      // Assert: check that the response is correctly serialized
      expect(paymentMethods.length, 2);
      expect(paymentMethods[0].status, 'In-Review');
      expect(paymentMethods[0].beneficiaryIban, 'GB29NWBK60161331926819');
      expect(paymentMethods[0].bankImage,
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn_bhPgvIrnWNmBgZz5YYe5rjflSYjf9WhEDa_Ia0&s');
      expect(paymentMethods[0].bankId, 4);
      expect(paymentMethods[0].bankName, 'Al Rajhi');

      expect(paymentMethods[1].status, null); // Check for null
      expect(paymentMethods[1].beneficiaryIban, 'AR29NWBK60161331926820');
      expect(paymentMethods[1].bankImage,
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn_bhPgvIrnWNmBgZz5YYe5rjflSYjf9WhEDa_Ia0&s');
      expect(paymentMethods[1].bankId, 4);
      expect(paymentMethods[1].bankName, 'Al Arabi');
    });
  });
}
