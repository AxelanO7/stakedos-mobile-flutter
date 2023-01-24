import 'package:json_annotation/json_annotation.dart';


part 'status_kehadiran_data.g.dart';

@JsonSerializable()
class StatusKehadiranData {
      StatusKehadiranData();

  String? catatan;
  int? id;
  @JsonKey(name: 'kehadiran_tempat') String? kehadiranTempat;
  @JsonKey(name: 'nama_dosen') String? namaDosen;
  int? nidn;
  @JsonKey(name: 'no_telepon') String? noTelepon;
  String? password;
  @JsonKey(name: 'status_kehadiran') String? statusKehadiran;
  @JsonKey(name: 'tipe_akun') String? tipeAkun;
  String? token;

  factory StatusKehadiranData.fromJson(Map<String,dynamic> json) => _$StatusKehadiranDataFromJson(json);
  Map<String, dynamic> toJson() => _$StatusKehadiranDataToJson(this);
}
