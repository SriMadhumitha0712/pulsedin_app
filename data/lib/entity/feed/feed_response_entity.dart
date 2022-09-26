// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:data/entity/feed/feed_entity.dart';
import 'package:domain/model/feed_response.dart';
import 'package:domain/utils/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feed_response_entity.g.dart';

@JsonSerializable()
class FeedResponseEntity
    implements BaseLayerDataTransformer<FeedResponseEntity, FeedResponse> {
  FeedsData? feedsData;

  FeedResponseEntity({
    this.feedsData,
  });

  @override
  factory FeedResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$FeedResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$FeedResponseEntityToJson(this);

  @override
  FeedResponseEntity restore(FeedResponse data) {
    throw UnimplementedError();
  }

  @override
  FeedResponse transform() {
    return FeedResponse(feeds: feedsData!.transform());
  }
}

@JsonSerializable()
class FeedsData implements BaseLayerDataTransformer<FeedsData, Feeds> {
  List<FeedEntity>? datas;
  FeedsData({
    this.datas,
  });

  @override
  factory FeedsData.fromJson(Map<String, dynamic> json) =>
      _$FeedsDataFromJson(json);
  Map<String, dynamic> toJson() => _$FeedsDataToJson(this);

  @override
  FeedsData restore(Feeds data) {
    throw UnimplementedError();
  }

  @override
  Feeds transform() {
    return Feeds(data: datas);
  }
}
