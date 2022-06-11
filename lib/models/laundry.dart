import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'laundry.g.dart';

@immutable
@JsonSerializable()
class Laundry extends Equatable {
  @JsonKey(defaultValue: '')
  final String laundryId;
  final String name;
  final String phone;
  final String address;
  final String userId;
  final int maxAmount;
  final User user;

  const Laundry({
    required this.laundryId,
    required this.name,
    required this.phone,
    required this.address,
    required this.userId,
    required this.maxAmount,
    this.user = const User.empty(),
  });

  const Laundry.empty()
      : laundryId = '',
        name = '',
        phone = '',
        address = '',
        userId = '',
        maxAmount = 0,
        user = const User.empty();

  factory Laundry.fromJson(Map<String, dynamic> json) {
    return _$LaundryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LaundryToJson(this);

  @override
  List<Object> get props {
    return [
      laundryId,
      name,
      phone,
      address,
      userId,
      maxAmount,
      user,
    ];
  }
}
