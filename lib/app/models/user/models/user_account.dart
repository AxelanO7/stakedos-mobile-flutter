import 'package:json_annotation/json_annotation.dart';


part 'user_account.g.dart';

@JsonSerializable()
class UserAccount {
      UserAccount();

  String? username;
  String? password;
  String? token;
  @JsonKey(name: 'tipe_akun') String? tipeAkun;
  int? id;

  factory UserAccount.fromJson(Map<String,dynamic> json) => _$UserAccountFromJson(json);
  Map<String, dynamic> toJson() => _$UserAccountToJson(this);
}
