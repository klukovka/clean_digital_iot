import 'dart:convert';

import 'base_exception.dart';

class ApiException implements BaseException {
  final int? statusCode;
  final String message;

  const ApiException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() {
    return message;
  }

  Map<String, dynamic> toMap() {
    return {
      'statusCode': statusCode,
      'message': message,
    };
  }

  factory ApiException.fromMap(Map<String, dynamic> map) {
    return ApiException(
      statusCode: map['statusCode']?.toInt(),
      message: map['message']?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiException.fromJson(String source) {
    return ApiException.fromMap(json.decode(source));
  }
}
