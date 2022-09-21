// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:data/entity/register/register_response.dart';
import 'package:data/repository/register_repository_impl.dart';
import 'package:domain/constants/domain_enums.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/base_error.dart';
import 'package:domain/model/error_info.dart';
import 'package:domain/usecase/base/base_usercase.dart';
import 'package:domain/usecase/base/params.dart';
import 'package:domain/utils/validator.dart';

class RegisterUseCase extends BaseUseCase<BaseError, RegisterUseCaseParams,
    RegisterResponseEntity> {
  final RegisterRepository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<BaseError, RegisterResponseEntity>> execute(
      {required RegisterUseCaseParams params}) async {
    return await _repository.register(
      email: params.email,
      password: params.password,
      first_name: params.first_name,
      user_type: 'nurse',
      last_name: params.last_name,
    );
  }
}

class RegisterUseCaseParams extends Params {
  final String email;
  final String password;

  final String first_name;
  final String last_name;

  RegisterUseCaseParams(this.email, this.password, this.first_name,
      this.last_name, );
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
    state = Validator.validate(first_name, rules: ['FirstName']);
    if (!state.status) {
      return Left(AppError(
          error: ErrorInfo(message: 'FirstName ${state.error}'),
          type: ErrorType.UI,
          cause: Exception()));
    }
    state = Validator.validate(last_name, rules: ['LastName']);
    if (!state.status) {
      return Left(AppError(
          error: ErrorInfo(message: 'LastName ${state.error}'),
          type: ErrorType.UI,
          cause: Exception()));
    }
    return const Right(true);
  }
}
