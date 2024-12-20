import 'package:dio/dio.dart';
import 'package:thrivve_flutter_assignment/core/network/api_endpoints.dart';

class WithdrawApiProvider {
  final Dio _dio;
  WithdrawApiProvider(this._dio);
  Future<List> getPaymentMethods() async {
    Response response = await _dio.get(ApiEndPoints.get_payment_methods);
    return response.data;
  }

  Future<Map<String, dynamic>> makeWithdraw() async {
    Response response = await _dio.get(ApiEndPoints.make_withdraw);
    return response.data as Map<String, dynamic>;
  }
}
