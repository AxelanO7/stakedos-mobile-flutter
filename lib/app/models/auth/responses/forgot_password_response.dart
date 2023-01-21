import 'package:json_annotation/json_annotation.dart';


part 'forgot_password_response.g.dart';

@JsonSerializable()
class ForgotPasswordResponse {
      ForgotPasswordResponse();

  late int status;
  late dynamic data;
  late List<dynamic> meta;
  late List<dynamic> messages;

  factory ForgotPasswordResponse.fromJson(Map<String,dynamic> json) => _$ForgotPasswordResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}
