import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:network/exceptions/exceptions.dart';
import 'package:network/src/api_helpers/globals.dart';
import 'package:network/src/app_settings/app_settings.dart';
import 'package:network/src/app_settings/mobile_os.dart';

var dioInterceptorProvider = Provider.family<List<Interceptor>, Dio>(
  (ref, dio) {
    final List<Interceptor> interceptors = [DioInterceptors(dio, ref.read)];
    if (kDebugMode) {
      interceptors.add(LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          request: true,
          error: true,
          responseHeader: true,
          logPrint: (value) {
            printAndSaveLog(value);
          }));
    }
    return interceptors;
  },
);

class DioInterceptors extends Interceptor {
  final Dio dio;
  final Reader _reader;

  DioInterceptors(this.dio, this._reader);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {

    if (options.uri.toString().contains("SendVerificationCode") ||
        options.uri.toString().contains("ValidateUser") ||
        options.uri.toString().contains("ResendVerificationCodes") ||
        options.uri.toString().contains("UpdProcessVerificationCode")) {
      options.headers['authorization'] = Globals().apiKey;
    } else {
      // add header

    }
    if (options.data is Map<String, dynamic>) {
      //add default params
      var params = <String, dynamic>{};
      if (options.data != null) {
        params = options.data;
      }
      final appSettings = AppSettings();


      options.data = params;
    }
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);

          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }
}
