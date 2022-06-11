import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'laundry.dart';

part 'mode.g.dart';

@immutable
@JsonSerializable()
class Mode extends Equatable {
  @JsonKey(defaultValue: '')
  final String modeId;
  final String name;
  final int time;
  final int costs;
  final String laundryId;
  final Laundry laundry;

  const Mode({
    required this.modeId,
    required this.name,
    required this.time,
    required this.costs,
    required this.laundryId,
    this.laundry = const Laundry.empty(),
  });

  const Mode.empty()
      : modeId = '',
        name = '',
        time = 0,
        costs = 0,
        laundryId = '',
        laundry = const Laundry.empty();

  factory Mode.fromJson(Map<String, dynamic> json) {
    return _$ModeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ModeToJson(this);

  @override
  List<Object> get props {
    return [
      modeId,
      name,
      time,
      costs,
      laundryId,
      laundry,
    ];
  }
}
