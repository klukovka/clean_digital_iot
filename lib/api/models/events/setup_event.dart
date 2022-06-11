import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'setup_event.g.dart';

@immutable
@JsonSerializable()
class SetupEvent extends Equatable {
  final String washMachineId;
  final String modeId;
  final int temperature;
  final int spinning;
  final String? additionalModeId;

  const SetupEvent({
    required this.washMachineId,
    required this.modeId,
    required this.spinning,
    required this.temperature,
    this.additionalModeId,
  });

  factory SetupEvent.fromJson(Map<String, dynamic> json) {
    return _$SetupEventFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SetupEventToJson(this);

  @override
  List<Object?> get props {
    return [
      washMachineId,
      modeId,
      temperature,
      spinning,
      additionalModeId,
    ];
  }
}
