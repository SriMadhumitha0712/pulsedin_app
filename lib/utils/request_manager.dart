// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:domain/error/base_error.dart';
import 'package:domain/usecase/base/params.dart';
import 'package:pulsedin_app/utils/resource.dart';

class RequestManager<T> {
  final StreamController<Resource<T>> _resource =
      StreamController<Resource<T>>();

  RequestManager(Params params,
      {required Future<Either<BaseError, T>> Function() createCall}) {
    _resource.sink.add(Resource.loading(data: null));
    params.verify().fold(
      (l) async {
        _resource.sink.add(
          Resource.error(error: l, data: null),
        );
        dispose();
      },
      (r) async {
        Either<BaseError, T> response = await createCall.call();
        response.fold((l) {
          _resource.sink.add(
            Resource.error(
              error: l.transform(),
            ),
          );
          dispose();
        }, (r) {
          _resource.sink.add(
            Resource.success(data: r),
          );
          dispose();
        });
      },
    );
  }

  Stream<Resource<T>> asFlow() => _resource.stream;

  void dispose() {
    _resource.close();
  }
}
