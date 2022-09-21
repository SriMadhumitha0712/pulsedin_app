import 'package:domain/usecase/register/register_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:pulsedin_app/base/base_page_view_model.dart';
import 'package:pulsedin_app/utils/app_stream.dart';
import 'package:pulsedin_app/utils/request_manager.dart';
import 'package:pulsedin_app/utils/resource.dart';
import 'package:pulsedin_app/utils/status.dart';

class RegisterPageViewModel extends BasePageViewModel
    with RegisterViewModelStreams {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  Stream<Resource<bool>> get isLoggedIn => _registerResponse.stream;

  Stream<Resource<bool>> get passwordObscured => _passwordObscure.stream;

  final RegisterUseCase _registerUseCase;
  RegisterPageViewModel(
    this._registerUseCase,
  ) {
    listenRegisterRequest();
  }

  void listenRegisterRequest() {
    _registerRequest.listen((value) {
      RequestManager(value,
              createCall: () => _registerUseCase.execute(params: value))
          .asFlow()
          .listen((event) async {
        updateLoader();
        if (event.status == Status.ERROR) {
          showToastWithError(event.appError!);
          showErrorState();
        }
      });
    });
  }

  triggerRegister() {
    _registerRequest.add(RegisterUseCaseParams(
      emailController.text,
      passwordController.text,
      firstNameController.text,
      lastNameController.text,
    ));
  }
}

mixin RegisterViewModelStreams {
  // Request Streams
  final _registerRequest = AppStream<RegisterUseCaseParams>();

  // Response Streams
  final _registerResponse = AppStream<Resource<bool>>(
      preserveState: true, initialValue: Resource.success(data: false));

  final _passwordObscure =
      AppStream<Resource<bool>>(initialValue: Resource.success(data: true));
}
