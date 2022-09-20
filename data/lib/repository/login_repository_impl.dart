import 'package:dartz/dartz.dart';

import 'package:data/entity/login/login_response_entity.dart';
import 'package:data/network/safe_api_call.dart';
import 'package:data/source/login_data_source.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDS _remoteDS;

  LoginRepositoryImpl(this._remoteDS);

  @override
  Future<Either<NetworkError, LoginResponseEntity>> login(
      {required String email, required String password}) async {
    final result = await safeApiCall(
      _remoteDS.login(email: email, password: password),
    );

    return result!.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }
}
