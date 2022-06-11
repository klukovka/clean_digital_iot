import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'laundry.dart';

part 'additional_mode.g.dart';

@immutable
@JsonSerializable()
class AdditionalMode extends Equatable {
  @JsonKey(defaultValue: '')
  final String additionalModeId;
  final String name;
  final int time;
  final int costs;
  final String laundryId;
  final Laundry laundry;

  const AdditionalMode({
    required this.additionalModeId,
    required this.name,
    required this.time,
    required this.costs,
    required this.laundryId,
    this.laundry = const Laundry.empty(),
  });

  const AdditionalMode.empty()
      : additionalModeId = '',
        name = '',
        time = 0,
        costs = 0,
        laundryId = '',
        laundry = const Laundry.empty();

  factory AdditionalMode.fromJson(Map<String, dynamic> json) {
    return _$AdditionalModeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AdditionalModeToJson(this);

  @override
  List<Object> get props {
    return [
      additionalModeId,
      name,
      time,
      costs,
      laundryId,
      laundry,
    ];
  }
}
