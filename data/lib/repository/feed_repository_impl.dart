import 'package:dartz/dartz.dart';
import 'package:data/entity/feed/feed_response_entity.dart';
import 'package:data/network/safe_api_call.dart';
import 'package:data/source/feed_data_source.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/repository/feed_repository.dart';


class FeedRepositoryImpl extends FeedRepository {
  final FeedRemoteDS _remoteDS;

  FeedRepositoryImpl(this._remoteDS);

  @override
  Future<Either<NetworkError, FeedData>> feed(
      ) async {
    final result = await safeApiCall(
      _remoteDS.feed(),
    );

    return result!.fold(
      (l) => Left(l),
      (r) => Right(r.data.feeds!),
    );
  }
}
