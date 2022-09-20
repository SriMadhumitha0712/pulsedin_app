import 'package:domain/error/app_error.dart';
import 'package:pulsedin_app/utils/status.dart';


class Resource<T> {
  final Status status;
  final T? data;
  final AppError? appError;

  Resource._({required this.status, this.data, this.appError});

  factory Resource.success({T? data}) {
    return Resource<T>._(status: Status.SUCCESS, data: data);
  }

  factory Resource.error({T? data, AppError? error}) {
    return Resource<T>._(status: Status.ERROR, data: data, appError: error);
  }

  factory Resource.loading({T? data}) {
    return Resource<T>._(
      data: data,
      status: Status.LOADING,
    );
  }

  factory Resource.none() {
    return Resource<T>._(
      data: null,
      status: Status.NONE,
    );
  }

  
}
