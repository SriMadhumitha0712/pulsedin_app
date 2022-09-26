import 'package:data/network/preference_helper.dart';
import 'package:domain/usecase/login/login_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:pulsedin_app/base/base_page_view_model.dart';
import 'package:pulsedin_app/utils/app_stream.dart';
import 'package:pulsedin_app/utils/request_manager.dart';
import 'package:pulsedin_app/utils/resource.dart';
import 'package:pulsedin_app/utils/status.dart';

class LoginPageViewModel extends BasePageViewModel with LoginViewModelStreams {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Stream<Resource<bool>> get isLoggedIn => _loginResponse.stream;

  Stream<Resource<bool>> get passwordObscured => _passwordObscure.stream;

  final LoginUseCase _loginUseCase;

  LoginPageViewModel(
    this._loginUseCase,
  ) {
    listenLoginRequest();
  }

  void listenLoginRequest() {
    _loginRequest.listen((value) {
      RequestManager(value,
              createCall: () => _loginUseCase.execute(params: value))
          .asFlow()
          .listen((event) async {
        updateLoader();
        if (event.status == Status.ERROR) {
          showToastWithError(event.appError!);
          showErrorState();
        }
        if (event.status == Status.SUCCESS) {
          await PreferenceHelper.saveToken(event.data!.token);
          _loginResponse.add(Resource.success(data: true));
          // print(' token : ${event.data!.token}');
        }
      });
    });
  }

  void triggerLogin() {
    _loginRequest
        .add(LoginUseCaseParams(emailController.text, passwordController.text));
  }

  void passwordVisibleChange() {
    _passwordObscure
        .add(Resource.success(data: !_passwordObscure.value!.data!));
  }
}

mixin LoginViewModelStreams {
  final _loginRequest = AppStream<LoginUseCaseParams>();

  final _loginResponse = AppStream<Resource<bool>>(
      preserveState: true, initialValue: Resource.success(data: false));

  final _passwordObscure =
      AppStream<Resource<bool>>(initialValue: Resource.success(data: true));
}
