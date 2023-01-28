import 'package:json_annotation/json_annotation.dart';


part 'reqres_data.g.dart';

@JsonSerializable()
class ReqresData {
      ReqresData();

  int? id;
  String? email;
  @JsonKey(name: 'first_name') String? firstName;
  @JsonKey(name: 'last_name') String? lastName;
  String? avatar;

  factory ReqresData.fromJson(Map<String,dynamic> json) => _$ReqresDataFromJson(json);
  Map<String, dynamic> toJson() => _$ReqresDataToJson(this);
}
