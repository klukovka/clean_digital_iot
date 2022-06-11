import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'role.dart';

part 'user.g.dart';

@immutable
@JsonSerializable()
class User extends Equatable {
  @JsonKey(defaultValue: '')
  final String userId;
  final String email;
  @JsonKey(defaultValue: '')
  final String password;
  final Role role;

  const User({
    required this.userId,
    required this.email,
    required this.password,
    required this.role,
  });

  const User.empty()
      : userId = '',
        email = '',
        password = '',
        role = Role.iot;

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [userId, email, password, role];
}
