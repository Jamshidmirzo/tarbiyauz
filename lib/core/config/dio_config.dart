import 'package:dio/dio.dart';
import 'package:tarbiyauz/core/constants/app_constants.dart';

class DioConfig {
  final Dio _dio;

  DioConfig()
      : _dio = Dio(BaseOptions(
          baseUrl: AppConstants.baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        ));

  Dio get client => _dio;
}
