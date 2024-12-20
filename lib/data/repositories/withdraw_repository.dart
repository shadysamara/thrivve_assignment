import 'package:thrivve_flutter_assignment/data/data_sources/withdraw_source_api.dart';
import 'package:thrivve_flutter_assignment/data/models/payment_method.dart';
import 'package:thrivve_flutter_assignment/data/models/withdraw_response.dart';

class WithdrawApiRepository {
  final WithdrawApiProvider withdrawApiProvider;
  WithdrawApiRepository(this.withdrawApiProvider);
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    List response = await withdrawApiProvider.getPaymentMethods();
    return response.map((e) {
      return PaymentMethodModel.fromJson(e);
    }).toList();
  }

  Future<WithdrawResponse> makeWithdraw() async {
    Map<String, dynamic> response = await withdrawApiProvider.makeWithdraw();
    return WithdrawResponse.fromJson(response);
  }
}
