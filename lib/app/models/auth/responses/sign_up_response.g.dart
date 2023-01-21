// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse()
      ..status = json['status'] as int
      ..data = SignUp.fromJson(json['data'] as Map<String, dynamic>)
      ..meta = json['meta'] as List<dynamic>
      ..messages = json['messages'] as List<dynamic>;

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'meta': instance.meta,
      'messages': instance.messages,
    };
