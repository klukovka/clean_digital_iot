import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../exceptions/api_exception.dart';
import '../exceptions/application_exception.dart';
import '../exceptions/base_exception.dart';
import '../exceptions/storage_null_value_exception.dart';

abstract class BaseService {
  Future<T> makeErrorHandledCall<T>(AsyncValueGetter<T> callback) async {
    const generalErrorMessage = 'IoT error';

    try {
      return await callback();
    } on StorageNullValueException {
      rethrow;
    } on ApplicationException {
      rethrow;
    } on DioError catch (error) {
      throw await _getProccessedDioError(error);
    } catch (exception) {
      throw const ApplicationException(generalErrorMessage);
    }
  }

  Future<BaseException> _getProccessedDioError(
    DioError exception,
  ) async {
    const unknownApiException = ApiException(
      message: 'Server error',
    );
    try {
      var response = exception.response?.data;
      if (response == null) {
        return unknownApiException;
      }
      final apiError = ApiException(
        message: response?['message'],
        statusCode: response?['statusCode'],
      );
      return apiError;
    } catch (_) {
      return unknownApiException;
    }
  }
}
