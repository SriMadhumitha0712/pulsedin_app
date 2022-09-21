// ignore_for_file: non_constant_identifier_names

import 'package:data/entity/register/register_response.dart';
import 'package:data/entity/request/register_request.dart';

import 'package:data/network/api_service.dart';
import 'package:data/source/register_data_source.dart';

import 'package:retrofit/dio.dart';

class RegisterRemoteDSImpl implements RegisterRemoteDS {
  final ApiService _apiService;

  RegisterRemoteDSImpl(this._apiService);

  @override
  Future<HttpResponse<RegisterResponseEntity>> register(
      {required String email,
      required String password,
      String? user_type,
      required String first_name,
      required String last_name}) {
    return _apiService.register(RegisterRequest(
      email: email,
      password: password,
      first_name: first_name,
      user_type: 'nurse',
      last_name: last_name,
    ));
  }
}
