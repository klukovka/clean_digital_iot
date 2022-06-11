import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'additional_mode.dart';
import 'mode.dart';

part 'event.g.dart';

@immutable
@JsonSerializable()
class Event extends Equatable {
  @JsonKey(defaultValue: '')
  final String eventId;
  final String washMachineId;
  final int temperature;
  final int spinning;
  final String modeId;
  final String? additionalModeId;
  final Mode mode;
  final AdditionalMode? additionalMode;
  final String? clientId;
  final DateTime? timeBegin;
  final DateTime? timeEnd;
  final bool paidStatus;
  final int paidBonuses;
  final int paidMoney;
  final bool taken;
  final int? rating;

  const Event({
    required this.eventId,
    required this.washMachineId,
    required this.temperature,
    required this.spinning,
    required this.modeId,
    required this.mode,
    required this.paidStatus,
    required this.paidBonuses,
    required this.paidMoney,
    required this.taken,
    required this.rating,
    this.additionalMode,
    this.clientId,
    this.timeBegin,
    this.additionalModeId,
    this.timeEnd,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return _$EventFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EventToJson(this);

  @override
  List<Object?> get props {
    return [
      eventId,
      washMachineId,
      temperature,
      spinning,
      modeId,
      additionalModeId,
      mode,
      additionalMode,
      clientId,
      timeBegin,
      timeEnd,
      paidStatus,
      paidBonuses,
      paidMoney,
      taken,
      rating,
    ];
  }
}
