// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      eventId: json['eventId'] as String? ?? '',
      washMachineId: json['washMachineId'] as String,
      temperature: json['temperature'] as int,
      spinning: json['spinning'] as int,
      modeId: json['modeId'] as String,
      mode: Mode.fromJson(json['mode'] as Map<String, dynamic>),
      paidStatus: json['paidStatus'] as bool,
      paidBonuses: json['paidBonuses'] as int,
      paidMoney: json['paidMoney'] as int,
      taken: json['taken'] as bool,
      rating: json['rating'] as int?,
      additionalMode: json['additionalMode'] == null
          ? null
          : AdditionalMode.fromJson(
              json['additionalMode'] as Map<String, dynamic>),
      clientId: json['clientId'] as String?,
      timeBegin: json['timeBegin'] == null
          ? null
          : DateTime.parse(json['timeBegin'] as String),
      additionalModeId: json['additionalModeId'] as String?,
      timeEnd: json['timeEnd'] == null
          ? null
          : DateTime.parse(json['timeEnd'] as String),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'eventId': instance.eventId,
      'washMachineId': instance.washMachineId,
      'temperature': instance.temperature,
      'spinning': instance.spinning,
      'modeId': instance.modeId,
      'additionalModeId': instance.additionalModeId,
      'mode': instance.mode,
      'additionalMode': instance.additionalMode,
      'clientId': instance.clientId,
      'timeBegin': instance.timeBegin?.toIso8601String(),
      'timeEnd': instance.timeEnd?.toIso8601String(),
      'paidStatus': instance.paidStatus,
      'paidBonuses': instance.paidBonuses,
      'paidMoney': instance.paidMoney,
      'taken': instance.taken,
      'rating': instance.rating,
    };
