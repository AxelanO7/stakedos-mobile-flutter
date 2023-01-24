// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_kehadiran_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusKehadiranData _$StatusKehadiranDataFromJson(Map<String, dynamic> json) =>
    StatusKehadiranData()
      ..catatan = json['catatan'] as String?
      ..id = json['id'] as int?
      ..kehadiranTempat = json['kehadiran_tempat'] as String?
      ..namaDosen = json['nama_dosen'] as String?
      ..nidn = json['nidn'] as int?
      ..noTelepon = json['no_telepon'] as String?
      ..password = json['password'] as String?
      ..statusKehadiran = json['status_kehadiran'] as String?
      ..tipeAkun = json['tipe_akun'] as String?
      ..token = json['token'] as String?;

Map<String, dynamic> _$StatusKehadiranDataToJson(
        StatusKehadiranData instance) =>
    <String, dynamic>{
      'catatan': instance.catatan,
      'id': instance.id,
      'kehadiran_tempat': instance.kehadiranTempat,
      'nama_dosen': instance.namaDosen,
      'nidn': instance.nidn,
      'no_telepon': instance.noTelepon,
      'password': instance.password,
      'status_kehadiran': instance.statusKehadiran,
      'tipe_akun': instance.tipeAkun,
      'token': instance.token,
    };
