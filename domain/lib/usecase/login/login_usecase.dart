import 'package:dartz/dartz.dart';
import 'package:data/entity/login/login_response_entity.dart';
import 'package:domain/constants/domain_enums.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/base_error.dart';
import 'package:domain/model/error_info.dart';
import 'package:domain/repository/login_repository.dart';
import 'package:domain/usecase/base/base_usercase.dart';
import 'package:domain/usecase/base/params.dart';
import 'package:domain/utils/validator.dart';

class LoginUseCase
    extends BaseUseCase<BaseError, LoginUseCaseParams, LoginResponseEntity> {
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<BaseError, LoginResponseEntity>> execute(
      {required LoginUseCaseParams params}) async {
    return await _repository.login(
        email: params.email, password: params.password);
  }
}

class LoginUseCaseParams extends Params {
  final String email;
  final String password;
  LoginUseCaseParams(this.email, this.password);
  @override
  Either<AppError, bool> verify() {
    ValidationState state;
    state = Validator.validate(email, rules: ['email']);
    if (!state.status) {
      return Left(AppError(
          error: ErrorInfo(message: 'Email ${state.error}'),
          type: ErrorType.UI,
          cause: Exception()));
    }

    state = Validator.validate(password, rules: ['required']);
    if (!state.status) {
      return Left(AppError(
          error: ErrorInfo(message: 'Password ${state.error}'),
          type: ErrorType.UI,
          cause: Exception()));
    }

    return const Right(true);
  }
}
