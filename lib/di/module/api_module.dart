import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../api/clean_digital_api_client.dart';
import '../../api/interceptors/header_api_interceptor.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio dio(HeaderApiInterceptor generalInterceptor) {
    return Dio()
      ..options.sendTimeout = 10000
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      )
      ..interceptors.add(generalInterceptor);
  }

  @lazySingleton
  CleanDigitalApiClient apiClient(Dio dio) => CleanDigitalApiClient(dio);
}
