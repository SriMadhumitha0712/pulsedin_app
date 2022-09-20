// ignore_for_file: constant_identifier_names

enum ErrorType {
  IOEXCEPTION,
  UI,

  //Network Error
  NETWORK,
  FORBIDDEN,
  SERVER_BROKEN,
  METHOD_NOT_ALLOWED,
  NET_NO_INTERNET_CONNECTION,
  TOO_MANY_REQUESTS,
  UN_AUTHORIZED,

  // UI ERROR
  INVALID_EMAIL,
  INVALID_PASSWORD,
  EMPTY_EMAIL,
  EMPTY_PASSWORD,
}