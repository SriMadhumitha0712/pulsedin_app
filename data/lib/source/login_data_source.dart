import 'package:data/entity/login/login_response_entity.dart';
import 'package:retrofit/retrofit.dart';

abstract class LoginRemoteDS {
  Future<HttpResponse<LoginResponseEntity>> login(
      {required String email, required String password});
}
