// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedResponseEntity _$FeedResponseEntityFromJson(Map<String, dynamic> json) =>
    FeedResponseEntity(
      status: json['status'] as bool?,
      feeds: json['feeds'] == null
          ? null
          : FeedData.fromJson(json['feeds'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedResponseEntityToJson(FeedResponseEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'feeds': instance.feeds,
    };

FeedData _$FeedDataFromJson(Map<String, dynamic> json) => FeedData(
      current_page: json['current_page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedDataToJson(FeedData instance) => <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data,
    };
