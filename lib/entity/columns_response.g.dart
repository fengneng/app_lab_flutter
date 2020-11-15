// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'columns_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColumnsResponse _$ColumnsResponseFromJson(Map<String, dynamic> json) {
  return ColumnsResponse(
    json['followersCount'] as int,
    json['description'] as String,
    json['intro'] as String,
  );
}

Map<String, dynamic> _$ColumnsResponseToJson(ColumnsResponse instance) =>
    <String, dynamic>{
      'followersCount': instance.followersCount,
      'description': instance.description,
      'intro': instance.intro,
    };
