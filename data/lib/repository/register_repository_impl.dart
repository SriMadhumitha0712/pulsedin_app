// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:data/entity/register/register_response.dart';

import 'package:data/network/safe_api_call.dart';

import 'package:data/source/register_data_source.dart';
import 'package:domain/error/network_error.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterRemoteDS _remoteDS;

  RegisterRepositoryImpl(this._remoteDS);

  @override
  Future<Either<NetworkError, RegisterResponseEntity>> register(
      {required String email,
      required String password,
      String? user_type,
      required String first_name,
      required String last_name}) async {
    final result = await safeApiCall(
      _remoteDS.register(
        email: email,
        password: password,
        user_type: 'nurse',
        first_name: first_name,
        last_name: last_name,
      ),
    );

    return result!.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }
}

abstract class RegisterRepository {
  Future<Either<NetworkError, RegisterResponseEntity>> register(
      {required String email,
      required String password,
      String user_type,
      required String first_name,
      required String last_name});
}
