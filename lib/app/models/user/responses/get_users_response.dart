import 'package:json_annotation/json_annotation.dart';
import '../models/user_account.dart';

part 'get_users_response.g.dart';

@JsonSerializable()
class GetUsersResponse {
      GetUsersResponse();

  int? status;
  List<UserAccount?>? data;

  factory GetUsersResponse.fromJson(Map<String,dynamic> json) => _$GetUsersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetUsersResponseToJson(this);
}
