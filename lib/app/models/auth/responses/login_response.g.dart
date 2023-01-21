// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse()
      ..status = json['status'] as int
      ..data = Login.fromJson(json['data'] as Map<String, dynamic>)
      ..meta = json['meta'] as List<dynamic>
      ..messages = json['messages'] as List<dynamic>;

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'meta': instance.meta,
      'messages': instance.messages,
    };
