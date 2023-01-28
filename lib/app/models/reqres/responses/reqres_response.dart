import 'package:json_annotation/json_annotation.dart';
import '../models/reqres_data.dart';

part 'reqres_response.g.dart';

@JsonSerializable()
class ReqresResponse {
      ReqresResponse();

  int? status;
  ReqresData? data;
  List<dynamic>? messages;

  factory ReqresResponse.fromJson(Map<String,dynamic> json) => _$ReqresResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReqresResponseToJson(this);
}
