// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_kehadiran_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusKehadiranData _$StatusKehadiranDataFromJson(Map<String, dynamic> json) =>
    StatusKehadiranData()
      ..id = json['id'] as int?
      ..email = json['email'] as String?
      ..firstName = json['first_name'] as String?
      ..lastName = json['last_name'] as String?
      ..avatar = json['avatar'] as String?;

Map<String, dynamic> _$StatusKehadiranDataToJson(
        StatusKehadiranData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
    };
