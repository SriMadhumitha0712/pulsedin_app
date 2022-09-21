import 'package:data/di/repository_module.dart';
import 'package:domain/usecase/feed/feed_usecase.dart';
import 'package:riverpod/riverpod.dart';

final feedUseCaseProvider = Provider.autoDispose<FeedUseCase>(
  (ref) => FeedUseCase(ref.read(feedRepoProvider)),
);
