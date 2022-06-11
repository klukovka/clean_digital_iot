import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../services/logout_service.dart';
import '../../services/preferences_service.dart';
import '../api_constants.dart';

@injectable
class HeaderApiInterceptor implements Interceptor {
  final PreferencesService _preferencesService;
  final LogoutService _logoutService;

  HeaderApiInterceptor(
    this._preferencesService,
    this._logoutService,
  );

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (_shouldLogOut(err.response?.statusCode)) {
      _logoutService.logout();
    } else {
      handler.next(err);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = _preferencesService.getAccessToken();

    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    final isInWhiteList = ApiConstants.endPointWhiteList
            .indexWhere((endPoint) => options.uri.path.contains(endPoint)) !=
        -1;

    if (!isInWhiteList && (accessToken.isEmpty)) {
      _logoutService.logout();
      return;
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.headers.map[Headers.contentTypeHeader]?.first
            .startsWith('text') ??
        false) {
      if (response.data.isNotEmpty) {
        response.data = jsonDecode(response.data as String);
      }
      return handler.next(response);
    }
    handler.next(response);
  }

  bool _shouldLogOut(int? statusCode) {
    if (statusCode == null) return false;

    const logOutStatuses = [401, 403];

    return logOutStatuses.contains(statusCode);
  }
}
