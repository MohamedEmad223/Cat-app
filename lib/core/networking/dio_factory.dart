import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final Dio _dio;
  Dio get dio => _dio;

  DioFactory() : _dio = Dio() {
    _dio.options
      ..connectTimeout = Duration(minutes: 1)
      ..receiveTimeout = Duration(minutes: 1)
      ..sendTimeout = Duration(minutes: 5)
      ..baseUrl = "http://api.thecatapi.com/";

    // _dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) async {
    //       final token =  CacheHelper.getString(key: 'token'); 
    //       if (token != null) {
    //         options.headers['Authorization'] = 'Bearer $token';
    //       }
    //       return handler.next(options);
    //     },
    //   ),
    // );

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );
  }
}