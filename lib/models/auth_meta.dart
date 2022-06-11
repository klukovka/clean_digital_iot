import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'role.dart';

part 'auth_meta.g.dart';

@immutable
@JsonSerializable()
class AuthMeta extends Equatable {
  final String token;
  final String userId;
  final String email;
  final String id;
  final Role role;

  const AuthMeta({
    required this.token,
    required this.userId,
    required this.email,
    required this.id,
    required this.role,
  });

  factory AuthMeta.fromJson(Map<String, dynamic> json) {
    return _$AuthMetaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthMetaToJson(this);

  @override
  List<Object> get props {
    return [
      token,
      userId,
      email,
      id,
      role,
    ];
  }
}
