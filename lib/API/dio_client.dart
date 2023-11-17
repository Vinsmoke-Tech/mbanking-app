import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.123.17:8000/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  // TODO: Add methods
}
