import 'package:domain/bus/event_bus.dart';
import 'package:domain/bus/un_authenticated_event.dart';
import 'package:domain/constants/domain_enums.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/base_error.dart';
import 'package:domain/model/error_info.dart';

class NetworkError extends BaseError {
  NetworkError(
      {required String httpError,
      String errorCode = "",
      String? message = "",
      required Exception cause,
      String description = ""})
      : super(
            error: ErrorInfo(
                code: httpError, message: errorCode, description: description),
            cause: cause);

  @override
  String getFriendlyMessage() {
    return error.message;
  }

  @override
  AppError transform() {
    switch (error.code) {
      case "500":
        return AppError(
            error: error, cause: cause, type: ErrorType.SERVER_BROKEN);

      case "403":
        return AppError(cause: cause, error: error, type: ErrorType.FORBIDDEN);

      case "401":
        eventBus.fire(UnAuthenticatedEvent());
        return AppError(
            cause: cause, error: error, type: ErrorType.UN_AUTHORIZED);

      case "404":
        return AppError(cause: cause, error: error, type: ErrorType.FORBIDDEN);

      case "405":
        return AppError(
            cause: cause, error: error, type: ErrorType.METHOD_NOT_ALLOWED);

      case "429":
        return AppError(
            cause: cause, error: error, type: ErrorType.TOO_MANY_REQUESTS);

      case "err-001":
        return AppError(
            cause: cause, error: error, type: ErrorType.INVALID_EMAIL);

      case "err-002":
        return AppError(
            cause: cause, error: error, type: ErrorType.INVALID_PASSWORD);

      default:
        return AppError(cause: cause, error: error, type: ErrorType.NETWORK);
    }
  }
}
