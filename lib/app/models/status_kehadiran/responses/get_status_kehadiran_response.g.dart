// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_status_kehadiran_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStatusKehadiranResponse _$GetStatusKehadiranResponseFromJson(
        Map<String, dynamic> json) =>
    GetStatusKehadiranResponse()
      ..status = json['status'] as int?
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : StatusKehadiranData.fromJson(e as Map<String, dynamic>))
          .toList()
      ..messages = json['messages'] as List<dynamic>?;

Map<String, dynamic> _$GetStatusKehadiranResponseToJson(
        GetStatusKehadiranResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'messages': instance.messages,
    };
