// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetupEvent _$SetupEventFromJson(Map<String, dynamic> json) => SetupEvent(
      washMachineId: json['washMachineId'] as String,
      modeId: json['modeId'] as String,
      spinning: json['spinning'] as int,
      temperature: json['temperature'] as int,
      additionalModeId: json['additionalModeId'] as String?,
    );

Map<String, dynamic> _$SetupEventToJson(SetupEvent instance) =>
    <String, dynamic>{
      'washMachineId': instance.washMachineId,
      'modeId': instance.modeId,
      'temperature': instance.temperature,
      'spinning': instance.spinning,
      'additionalModeId': instance.additionalModeId,
    };
