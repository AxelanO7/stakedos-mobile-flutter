// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersResponse _$GetUsersResponseFromJson(Map<String, dynamic> json) =>
    GetUsersResponse()
      ..status = json['status'] as int?
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : UserAccount.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetUsersResponseToJson(GetUsersResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
