import 'package:json_annotation/json_annotation.dart';


part 'status_kehadiran_data.g.dart';

@JsonSerializable()
class StatusKehadiranData {
      StatusKehadiranData();

  int? id;
  String? email;
  @JsonKey(name: 'first_name') String? firstName;
  @JsonKey(name: 'last_name') String? lastName;
  String? avatar;

  factory StatusKehadiranData.fromJson(Map<String,dynamic> json) => _$StatusKehadiranDataFromJson(json);
  Map<String, dynamic> toJson() => _$StatusKehadiranDataToJson(this);
}
