import 'package:domain/constants/domain_enums.dart';
import 'package:domain/error/app_error.dart';

import 'package:pulsedin_app/generated/l10n.dart';

class ErrorParser {
  ErrorParser._();

  static String getLocalisedStringError(
      {AppError? error, required S localisedHelper}) {
    switch (error?.type) {
      case ErrorType.IOEXCEPTION:
        return localisedHelper.genericError;
      case ErrorType.UI:
        return error!.error.message;
      case ErrorType.NETWORK:
        return error!.error.message;
      case ErrorType.EMPTY_PASSWORD:
        return localisedHelper.enterPassword;
      case ErrorType.EMPTY_EMAIL:
        return localisedHelper.emptyEmailMessage;
      case ErrorType.INVALID_EMAIL:
        return localisedHelper.enterValidEmail;
      case ErrorType.FORBIDDEN:
        return localisedHelper.forbidden;
      case ErrorType.NET_NO_INTERNET_CONNECTION:
        return localisedHelper.checkYourInternetConnection;
      case ErrorType.SERVER_BROKEN:
        return localisedHelper.serverBroken;
      case ErrorType.UN_AUTHORIZED:
        return localisedHelper.unauthenticated;
      case ErrorType.METHOD_NOT_ALLOWED:
        return localisedHelper.methodNotAllowed;
      default:
        return "";
    }
  }
}
