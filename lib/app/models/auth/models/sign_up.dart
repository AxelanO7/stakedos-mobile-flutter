import 'package:json_annotation/json_annotation.dart';


part 'sign_up.g.dart';

@JsonSerializable()
class SignUp {
      SignUp();

  late String token;

  factory SignUp.fromJson(Map<String,dynamic> json) => _$SignUpFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpToJson(this);
}
