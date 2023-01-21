import 'package:json_annotation/json_annotation.dart';
import '../models/status_kehadiran_data.dart';

part 'get_status_kehadiran_detail_response.g.dart';

@JsonSerializable()
class GetStatusKehadiranDetailResponse {
      GetStatusKehadiranDetailResponse();

  int? status;
  StatusKehadiranData? data;
  List<dynamic>? messages;

  factory GetStatusKehadiranDetailResponse.fromJson(Map<String,dynamic> json) => _$GetStatusKehadiranDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetStatusKehadiranDetailResponseToJson(this);
}
