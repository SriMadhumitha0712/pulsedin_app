import 'package:domain/usecase/feed/feed_usecase.dart';
import 'package:pulsedin_app/base/base_page_view_model.dart';
import 'package:pulsedin_app/utils/app_stream.dart';
import 'package:pulsedin_app/utils/request_manager.dart';
import 'package:pulsedin_app/utils/resource.dart';
import 'package:pulsedin_app/utils/status.dart';

class FeedPageViewModel extends BasePageViewModel with FeedViewModelStreams {
  Stream<Resource<bool>> get isLoggedIn => _feedResponse.stream;

  final FeedUseCase _feedUseCase;
  FeedPageViewModel(
    this._feedUseCase,
  ) {
    listenFeedRequest();
  }

  void listenFeedRequest() {
    _feedRequest.listen((value) {
      RequestManager(value,
              createCall: () => _feedUseCase.execute(params: value))
          .asFlow()
          .listen((event) async {
        updateLoader();
        if (event.status == Status.ERROR) {
          showToastWithError(event.appError!);
          showErrorState();
        }
      });
    });
  }

  void triggerFeed() {
    _feedRequest.add(FeedUseCaseParams());
  }
}

mixin FeedViewModelStreams {
  // Request Streams
  final _feedRequest = AppStream<FeedUseCaseParams>();

  // Response Streams
  final _feedResponse = AppStream<Resource<bool>>(
      preserveState: true, initialValue: Resource.success(data: false));
}
