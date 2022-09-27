import 'package:data/entity/feed/feed_entity.dart';
import 'package:domain/usecase/feed/feed_usecase.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:pulsedin_app/base/base_page_view_model.dart';
import 'package:pulsedin_app/utils/app_stream.dart';
import 'package:pulsedin_app/utils/request_manager.dart';
import 'package:pulsedin_app/utils/resource.dart';
import 'package:pulsedin_app/utils/status.dart';

class FeedPageViewModel extends BasePageViewModel with FeedViewModelStreams {
  Stream<Resource<List<Data>>> get feeds => _feedResponse.stream;

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
    _feedRequest.listen(
      (value) {
        RequestManager(value,
                createCall: () => _feedUseCase.execute(params: value))
            .asFlow()
            .listen(
          (event) async {
            updateLoader();
            if (event.status == Status.ERROR) {
              showToastWithError(event.appError!);
              showErrorState();
            }

            if (event.status == Status.SUCCESS) {
              _feedResponse.add(Resource.success(data: event.data!.data));
            }
          },
        );
      },
    );
  }

  Future<void> share(Payload payload) async {
    await FlutterShare.share(
        title: 'Share Post',
        text: 'Pulsedin',
        linkUrl: payload.nurseInfo!.first_name,
        chooserTitle: 'Share Post from Pulsedin');
  }

  like(Payload payload) {
    if (payload.is_like!) {
      payload.like_count = payload.like_count! - 1;
    } else {
      payload.like_count = payload.like_count! + 1;
    }
    payload.is_like = !payload.is_like!;

    _feedResponse.add(_feedResponse.value!);
  }
}

mixin FeedViewModelStreams {
  final _feedRequest = AppStream<FeedUseCaseParams>();

  final _feedResponse = AppStream<Resource<List<Data>>>(
    preserveState: true,
  );
}
