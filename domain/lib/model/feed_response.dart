import 'package:data/entity/feed/feed_entity.dart';

class FeedResponse {
  Feeds? feeds;
  FeedResponse({
    this.feeds,
  });
}

class Feeds {
  List<FeedEntity>? data;
  Feeds({
    this.data,
  });
}
