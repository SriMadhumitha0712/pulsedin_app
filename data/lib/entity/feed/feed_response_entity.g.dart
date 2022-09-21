// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedResponseEntity _$FeedResponseEntityFromJson(Map<String, dynamic> json) =>
    FeedResponseEntity(
      feeds: json['feeds'] == null
          ? null
          : Feeds.fromJson(json['feeds'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedResponseEntityToJson(FeedResponseEntity instance) =>
    <String, dynamic>{
      'feeds': instance.feeds,
    };

Feeds _$FeedsFromJson(Map<String, dynamic> json) => Feeds(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FeedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedsToJson(Feeds instance) => <String, dynamic>{
      'data': instance.data,
    };
