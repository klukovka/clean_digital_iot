// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mode _$ModeFromJson(Map<String, dynamic> json) => Mode(
      modeId: json['modeId'] as String? ?? '',
      name: json['name'] as String,
      time: json['time'] as int,
      costs: json['costs'] as int,
      laundryId: json['laundryId'] as String,
      laundry: json['laundry'] == null
          ? const Laundry.empty()
          : Laundry.fromJson(json['laundry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModeToJson(Mode instance) => <String, dynamic>{
      'modeId': instance.modeId,
      'name': instance.name,
      'time': instance.time,
      'costs': instance.costs,
      'laundryId': instance.laundryId,
      'laundry': instance.laundry,
    };
