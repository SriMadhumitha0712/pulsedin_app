// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedResponseEntity _$FeedResponseEntityFromJson(Map<String, dynamic> json) =>
    FeedResponseEntity(
      feedsData: json['feeds'] == null
          ? null
          : FeedsData.fromJson(json['feeds'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedResponseEntityToJson(FeedResponseEntity instance) =>
    <String, dynamic>{
      'feeds': instance.feedsData,
    };

FeedsData _$FeedsDataFromJson(Map<String, dynamic> json) => FeedsData(
      datas: (json['data'] as List<dynamic>?)
          ?.map((e) => FeedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedsDataToJson(FeedsData instance) => <String, dynamic>{
      'data': instance.datas,
    };
