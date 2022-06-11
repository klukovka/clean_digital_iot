// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalMode _$AdditionalModeFromJson(Map<String, dynamic> json) =>
    AdditionalMode(
      additionalModeId: json['additionalModeId'] as String? ?? '',
      name: json['name'] as String,
      time: json['time'] as int,
      costs: json['costs'] as int,
      laundryId: json['laundryId'] as String,
      laundry: json['laundry'] == null
          ? const Laundry.empty()
          : Laundry.fromJson(json['laundry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdditionalModeToJson(AdditionalMode instance) =>
    <String, dynamic>{
      'additionalModeId': instance.additionalModeId,
      'name': instance.name,
      'time': instance.time,
      'costs': instance.costs,
      'laundryId': instance.laundryId,
      'laundry': instance.laundry,
    };
