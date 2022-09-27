// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:data/entity/feed/feed_response_entity.dart';
import 'package:domain/error/network_error.dart';

abstract class FeedRepository {
  Future<Either<NetworkError, FeedData>> feed();
}
