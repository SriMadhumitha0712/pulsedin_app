// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:data/entity/feed/feed_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feed_response_entity.g.dart';

@JsonSerializable()
class FeedResponseEntity {
  bool? status;
  FeedData? feeds;
  FeedResponseEntity({
    this.status,
    this.feeds,
  });

  @override
  factory FeedResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$FeedResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$FeedResponseEntityToJson(this);
}

@JsonSerializable()
class FeedData {
  int? current_page;
  List<Data>? data;

  FeedData({
    this.current_page,
    this.data,
  });

  @override
  factory FeedData.fromJson(Map<String, dynamic> json) =>
      _$FeedDataFromJson(json);
  Map<String, dynamic> toJson() => _$FeedDataToJson(this);
}
