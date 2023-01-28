import 'package:json_annotation/json_annotation.dart';
import '../models/status_kehadiran_data.dart';

part 'get_status_kehadiran_response.g.dart';

@JsonSerializable()
class GetStatusKehadiranResponse {
  GetStatusKehadiranResponse();

  int? status;
  List<StatusKehadiranData?>? data;
  List<dynamic>? messages;

  factory GetStatusKehadiranResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStatusKehadiranResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetStatusKehadiranResponseToJson(this);
}
