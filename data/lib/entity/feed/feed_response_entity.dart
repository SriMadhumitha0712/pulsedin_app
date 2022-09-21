// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:data/entity/feed/feed_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feed_response_entity.g.dart';

@JsonSerializable()
class FeedResponseEntity {
  Feeds? feeds;
  FeedResponseEntity({
    this.feeds,
  });

  @override
  factory FeedResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$FeedResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$FeedResponseEntityToJson(this);
}

@JsonSerializable()
class Feeds {
  List<FeedEntity>? data;
  Feeds({
    this.data,
  });

  @override
  factory Feeds.fromJson(Map<String, dynamic> json) => _$FeedsFromJson(json);
  Map<String, dynamic> toJson() => _$FeedsToJson(this);
}
