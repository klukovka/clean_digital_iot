import 'package:json_annotation/json_annotation.dart';

enum Role {
  @JsonValue('ADMIN')
  admin,
  @JsonValue('LAUNDRY')
  laundry,
  @JsonValue('EMPLOYEE')
  employee,
  @JsonValue('CLIENT')
  client,
  @JsonValue('IOT')
  iot,
  @JsonValue('REPAIR_COMPANY')
  repairCompany;
}
