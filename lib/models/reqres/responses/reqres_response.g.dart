// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reqres_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqresResponse _$ReqresResponseFromJson(Map<String, dynamic> json) =>
    ReqresResponse()
      ..status = json['status'] as int?
      ..data = json['data'] == null
          ? null
          : ReqresData.fromJson(json['data'] as Map<String, dynamic>)
      ..messages = json['messages'] as List<dynamic>?;

Map<String, dynamic> _$ReqresResponseToJson(ReqresResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'messages': instance.messages,
    };
