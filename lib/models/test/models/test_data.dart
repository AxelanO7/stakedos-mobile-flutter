import 'package:json_annotation/json_annotation.dart';


part 'test_data.g.dart';

@JsonSerializable()
class TestData {
      TestData();

  String? test;
  int? test2;
  String? test3;

  factory TestData.fromJson(Map<String,dynamic> json) => _$TestDataFromJson(json);
  Map<String, dynamic> toJson() => _$TestDataToJson(this);
}
