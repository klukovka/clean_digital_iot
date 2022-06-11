// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laundry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Laundry _$LaundryFromJson(Map<String, dynamic> json) => Laundry(
      laundryId: json['laundryId'] as String? ?? '',
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      userId: json['userId'] as String,
      maxAmount: json['maxAmount'] as int,
      user: json['user'] == null
          ? const User.empty()
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LaundryToJson(Laundry instance) => <String, dynamic>{
      'laundryId': instance.laundryId,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'userId': instance.userId,
      'maxAmount': instance.maxAmount,
      'user': instance.user,
    };
