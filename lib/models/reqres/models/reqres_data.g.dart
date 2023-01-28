// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reqres_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqresData _$ReqresDataFromJson(Map<String, dynamic> json) => ReqresData()
  ..id = json['id'] as int?
  ..email = json['email'] as String?
  ..firstName = json['first_name'] as String?
  ..lastName = json['last_name'] as String?
  ..avatar = json['avatar'] as String?;

Map<String, dynamic> _$ReqresDataToJson(ReqresData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
    };
