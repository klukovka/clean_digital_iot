// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthMeta _$AuthMetaFromJson(Map<String, dynamic> json) => AuthMeta(
      token: json['token'] as String,
      userId: json['userId'] as String,
      email: json['email'] as String,
      id: json['id'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
    );

Map<String, dynamic> _$AuthMetaToJson(AuthMeta instance) => <String, dynamic>{
      'token': instance.token,
      'userId': instance.userId,
      'email': instance.email,
      'id': instance.id,
      'role': _$RoleEnumMap[instance.role],
    };

const _$RoleEnumMap = {
  Role.admin: 'ADMIN',
  Role.laundry: 'LAUNDRY',
  Role.employee: 'EMPLOYEE',
  Role.client: 'CLIENT',
  Role.iot: 'IOT',
  Role.repairCompany: 'REPAIR_COMPANY',
};
