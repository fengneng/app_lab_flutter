import 'package:json_annotation/json_annotation.dart';

part 'columns_response.g.dart';

@JsonSerializable()
class ColumnsResponse {
  int followersCount;
  String description;
  String intro;

  ColumnsResponse(this.followersCount, this.description, this.intro);

  factory ColumnsResponse.fromJson(Map<String, dynamic> json) =>
      _$ColumnsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ColumnsResponseToJson(this);
}
