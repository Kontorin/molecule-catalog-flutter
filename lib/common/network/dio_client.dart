import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static const baseUrl = 'https://www.ebi.ac.uk/chembl/api/data/';

  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Accept': 'application/json'},
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          responseBody: false,
          logPrint: (message) => debugPrint(message.toString()),
        ),
      );
    }

    return dio;
  }
}
