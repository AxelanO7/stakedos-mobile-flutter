// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestResponse _$TestResponseFromJson(Map<String, dynamic> json) => TestResponse()
  ..status = json['status'] as int?
  ..data = json['data'] == null
      ? null
      : TestData.fromJson(json['data'] as Map<String, dynamic>)
  ..messages = json['messages'] as List<dynamic>?;

Map<String, dynamic> _$TestResponseToJson(TestResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'messages': instance.messages,
    };
