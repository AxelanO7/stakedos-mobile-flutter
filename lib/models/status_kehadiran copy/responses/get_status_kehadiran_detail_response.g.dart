// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_status_kehadiran_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStatusKehadiranDetailResponse _$GetStatusKehadiranDetailResponseFromJson(
        Map<String, dynamic> json) =>
    GetStatusKehadiranDetailResponse()
      ..status = json['status'] as int?
      ..data = json['data'] == null
          ? null
          : StatusKehadiranData.fromJson(json['data'] as Map<String, dynamic>)
      ..messages = json['messages'] as List<dynamic>?;

Map<String, dynamic> _$GetStatusKehadiranDetailResponseToJson(
        GetStatusKehadiranDetailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'messages': instance.messages,
    };
