import 'package:json_annotation/json_annotation.dart';
import '../models/login.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
      LoginResponse();

  late int status;
  late Login data;
  late List<dynamic> meta;
  late List<dynamic> messages;

  factory LoginResponse.fromJson(Map<String,dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
