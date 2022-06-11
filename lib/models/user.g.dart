// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['userId'] as String? ?? '',
      email: json['email'] as String,
      password: json['password'] as String? ?? '',
      role: $enumDecode(_$RoleEnumMap, json['role']),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'password': instance.password,
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
