// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) => UserAccount()
  ..username = json['username'] as String?
  ..password = json['password'] as String?
  ..token = json['token'] as String?
  ..tipeAkun = json['tipe_akun'] as String?
  ..id = json['id'] as int?;

Map<String, dynamic> _$UserAccountToJson(UserAccount instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'token': instance.token,
      'tipe_akun': instance.tipeAkun,
      'id': instance.id,
    };
