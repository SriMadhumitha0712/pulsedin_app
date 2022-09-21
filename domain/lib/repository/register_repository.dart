// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';

import 'package:data/entity/register/register_response.dart';

import 'package:domain/error/network_error.dart';

abstract class RegisterRepository {
  Future<Either<NetworkError, RegisterResponseEntity>> register(
      {required String email,
      required String password,
      String? user_type,
      required String first_name,
      required String last_name});
}
