import 'package:domain/di/feed_use_case_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulsedin_app/feature/feed/feed_page_view_model.dart';

final feedModuleProvider =
    ChangeNotifierProvider.autoDispose<FeedPageViewModel>((ref) {
  return FeedPageViewModel(ref.read(feedUseCaseProvider));
});
