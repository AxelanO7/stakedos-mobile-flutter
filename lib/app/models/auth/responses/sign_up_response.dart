import 'package:json_annotation/json_annotation.dart';
import '../models/sign_up.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
      SignUpResponse();

  late int status;
  late SignUp data;
  late List<dynamic> meta;
  late List<dynamic> messages;

  factory SignUpResponse.fromJson(Map<String,dynamic> json) => _$SignUpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
