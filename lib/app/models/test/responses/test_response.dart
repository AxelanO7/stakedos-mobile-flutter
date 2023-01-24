import 'package:json_annotation/json_annotation.dart';
import '../models/test_data.dart';

part 'test_response.g.dart';

@JsonSerializable()
class TestResponse {
      TestResponse();

  int? status;
  TestData? data;
  List<dynamic>? messages;

  factory TestResponse.fromJson(Map<String,dynamic> json) => _$TestResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TestResponseToJson(this);
}
