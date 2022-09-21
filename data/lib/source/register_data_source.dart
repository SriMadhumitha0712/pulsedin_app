// ignore_for_file: non_constant_identifier_names

import 'package:data/entity/register/register_response.dart';
import 'package:retrofit/retrofit.dart';

abstract class RegisterRemoteDS {
  Future<HttpResponse<RegisterResponseEntity>> register(
      {required String email,
      required String password,
       String? user_type,
      required String first_name,
      required String last_name});
}
