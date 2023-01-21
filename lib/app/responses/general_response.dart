import 'package:json_annotation/json_annotation.dart';


part 'general_response.g.dart';

@JsonSerializable()
class GeneralResponse {
      GeneralResponse();

  late int status;
  late List<dynamic> meta;
  late List<dynamic> messages;

  factory GeneralResponse.fromJson(Map<String,dynamic> json) => _$GeneralResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GeneralResponseToJson(this);
}
