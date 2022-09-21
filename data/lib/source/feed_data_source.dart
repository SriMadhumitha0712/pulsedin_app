


import 'package:data/entity/feed/feed_response_entity.dart';
import 'package:retrofit/retrofit.dart';

abstract class FeedRemoteDS {
  Future<HttpResponse<FeedResponseEntity>> feed(
      );
}
