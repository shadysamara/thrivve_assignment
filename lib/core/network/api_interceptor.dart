import 'dart:developer';

import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  final _cache = <Uri, Response>{};

  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    logRequest(options);
    super.onRequest(options, handler);
    _handleCache(options, handler);
  }

  @override
  Future<dynamic> onError(DioException err, ErrorInterceptorHandler handler) {
    logError(err);
    int errorCode = err.response?.statusCode ?? 0;
    if (errorCode >= 500) {
// server error
    } else if (errorCode >= 400) {
      //request code
    } else {
      //default error
    }

    return _handleCachedResponse(err, handler);
  }

  @override
  Future<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    _cache[response.requestOptions.uri] = response;
    return Future.value(response);
  }

  // Helper Methods

  void logRequest(RequestOptions options) {
    log(options.baseUrl + options.path);
  }

  void _handleCache(RequestOptions options, RequestInterceptorHandler handler) {
    var cachedResponse = _cache[options.uri];
    if (cachedResponse != null && options.method == 'get') {
      handler.resolve(cachedResponse);
    }
  }

  void logError(DioException err) {
    log("The request that caused the error is ${err.requestOptions.path}");
    log(err.response?.toString() ?? '');
  }

  void _handleError(DioException err) {
    // if (Get.currentRoute != RoutesNames.splachPageRoute) {
    //     CustomDialougs.showCustomBottomsheet(const SignInBottomsheet());
    //   }
  }

  // void _showErrorDialog(
  //     DioException err, String titleKey, String errorMessage) {
  //   CustomDialougs.showDialoug(
  //     errorMessage,
  //     titleKey: titleKey,
  //     imageName: 'error',
  //     footer: ElevatedButton(
  //       onPressed: () {
  //         Get.back();
  //       },
  //       child: Text("ok".tr),
  //     ),
  //   );
  // }

  Future<dynamic> _handleCachedResponse(
      DioException err, ErrorInterceptorHandler handler) {
    var cachedResponse = _cache[err.requestOptions.uri];
    if (cachedResponse != null) {
      return Future.value(cachedResponse);
    }
    return Future.value(err);
  }
}
