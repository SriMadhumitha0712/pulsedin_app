import 'package:dartz/dartz.dart';
import 'package:data/entity/feed/feed_response_entity.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/base_error.dart';
import 'package:domain/repository/feed_repository.dart';
import 'package:domain/usecase/base/base_usercase.dart';
import 'package:domain/usecase/base/params.dart';

class FeedUseCase
    extends BaseUseCase<BaseError, FeedUseCaseParams, FeedResponseEntity> {
  final FeedRepository _repository;

  FeedUseCase(this._repository);

  @override
  Future<Either<BaseError, FeedResponseEntity>> execute(
      {required FeedUseCaseParams params}) async {
    return await _repository.feed();
  }
}

class FeedUseCaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}
