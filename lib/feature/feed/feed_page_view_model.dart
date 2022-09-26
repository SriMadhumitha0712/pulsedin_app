import 'package:data/entity/feed/feed_response_entity.dart';
import 'package:domain/model/feeds_data.dart';
import 'package:domain/usecase/feed/feed_usecase.dart';
import 'package:pulsedin_app/base/base_page_view_model.dart';
import 'package:pulsedin_app/utils/app_stream.dart';
import 'package:pulsedin_app/utils/request_manager.dart';
import 'package:pulsedin_app/utils/resource.dart';
import 'package:pulsedin_app/utils/status.dart';

class FeedPageViewModel extends BasePageViewModel with FeedViewModelStreams {
  Stream<Resource<FeedResponseEntity>> get feedData => _feedResponse.stream;

  List<Feed> feed = [];
  final FeedUseCase _feedUseCase;

  FeedPageViewModel(
    this._feedUseCase,
  ) {
    listenRegisterRequest();
    triggerFeed();
  }

  triggerFeed() {
    _feedRequest.add(FeedUseCaseParams());
  }

  void listenRegisterRequest() {
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

        if (event.status == Status.SUCCESS) {
          feed.addAll(
              event.data!.feedsData!.datas!.map((e) => e.transform()).toList());
          _feedResponse.add(Resource.success(data: event.data));
        }
      });
    });
  }
}

mixin FeedViewModelStreams {
  final _feedRequest = AppStream<FeedUseCaseParams>();

  final _feedResponse = AppStream<Resource<FeedResponseEntity>>(
    preserveState: true,
  );
}
