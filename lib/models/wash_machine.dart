import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'laundry.dart';

part 'wash_machine.g.dart';

@immutable
@JsonSerializable()
class WashMachine extends Equatable {
  @JsonKey(defaultValue: '', name: '_id')
  final String washMachineId;
  @JsonKey(name: 'laundry')
  final String laundryId;
  final String model;
  final String manufacturer;
  final int capacity;
  final int powerUsage;
  final int spinningSpeed;
  final int maxTime;
  final int currentTime;
  final bool isWorking;
  final bool isWashing;

  const WashMachine({
    required this.washMachineId,
    required this.laundryId,
    required this.model,
    required this.manufacturer,
    required this.capacity,
    required this.powerUsage,
    required this.spinningSpeed,
    required this.maxTime,
    required this.currentTime,
    required this.isWorking,
    required this.isWashing,
  });

  const WashMachine.empty()
      : washMachineId = '',
        laundryId = '',
        model = '',
        manufacturer = '',
        capacity = 0,
        powerUsage = 0,
        spinningSpeed = 0,
        maxTime = 0,
        currentTime = 0,
        isWashing = false,
        isWorking = false;

  factory WashMachine.fromJson(Map<String, dynamic> json) {
    return _$WashMachineFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WashMachineToJson(this);

  @override
  List<Object> get props {
    return [
      washMachineId,
      laundryId,
      model,
      manufacturer,
      capacity,
      powerUsage,
      spinningSpeed,
      maxTime,
      currentTime,
      isWorking,
      isWashing,
    ];
  }
}
