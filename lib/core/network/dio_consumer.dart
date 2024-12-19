import 'package:dio/dio.dart';
import 'package:thrivve_flutter_assignment/core/network/api_interceptor.dart';
import 'package:thrivve_flutter_assignment/main.dart';

initSettingsAndDio() async {
  var dio = Dio()
    ..interceptors.add(AppInterceptors())
    ..options.followRedirects = false
    ..options.validateStatus = (status) {
      return status! < 300;
    };
  getIt.registerSingleton<Dio>(dio);
}
