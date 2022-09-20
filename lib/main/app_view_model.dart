// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:data/network/preference_helper.dart';
import 'package:domain/error/local_error.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pulsedin_app/base/base_view_model.dart';
import 'package:pulsedin_app/utils/app_stream.dart';
import 'package:pulsedin_app/utils/enums.dart';

class AppViewModel extends BaseViewModel with AppViewModelStreams {
  Stream<AuthenticationStatus> get authStateStream => _authStateResponse.stream;

  AuthenticationStatus get authState => _authStateResponse.value!;

  Stream<String> get appVersion => _appVersionResponse.stream;

  Stream<String> get currentToken => _currentTokenResponse.stream;

  AppViewModel() {
    listenAppVersionRequest();
    listenAuthStateRequest();
    listenCurrentTokenRequest();
    getPackageInfo();
    login();
  }
  void listenAppVersionRequest() {
    _appVersionRequest.listen((value) async {
      if (value) {
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        _appVersionResponse.add(packageInfo.version);
      }
    });
  }

  void listenAuthStateRequest() {
    _authStateRequest.listen((value) {
      _authStateResponse.add(value);
    });
  }

  void listenCurrentTokenRequest() {
    _currentTokenRequest.listen((value) async {
      if (value) {
        final token = await PreferenceHelper.getToken();
        if (token is Right<LocalError, String?>) {
          if (token.value != null) {
            _currentTokenResponse.add(token.value!);
          }
        }
      }
    });
  }

  void getPackageInfo() {
    _appVersionRequest.add(true);
  }

  void getCurrentToken() {
    _currentTokenRequest.add(true);
  }

  void getCurrentUser() {
    _currentUserRequest.add(true);
  }

  Future<void> login() async {
    final token = await PreferenceHelper.getToken();

    if (token is Right<LocalError, String?>) {
      if (token.value != null) {
        getCurrentToken();
        getCurrentUser();
        _authStateRequest.add(AuthenticationStatus.AUTHENTICATED);
      } else {
        _authStateRequest.add(AuthenticationStatus.UNAUTHENTICATED);
      }
    } else {
      _authStateRequest.add(AuthenticationStatus.UNAUTHENTICATED);
    }
  }

  Future<void> logout() async {
    await PreferenceHelper.clearStorage();
    _authStateRequest.add(AuthenticationStatus.UNAUTHENTICATED);
  }

  void changeAuthStatus(AuthenticationStatus authenticationStatus) {
    _authStateRequest.add(authenticationStatus);
  }
}

mixin AppViewModelStreams {
  final _appVersionRequest = AppStream<bool>();
  final _currentTokenRequest = AppStream<bool>();
  final _currentUserRequest = AppStream<bool>();

  final _authStateResponse = AppStream<AuthenticationStatus>(
      preserveState: false, initialValue: AuthenticationStatus.UNAUTHENTICATED);

  final _authStateRequest = AppStream<AuthenticationStatus>();

  final _appVersionResponse = AppStream<String>(preserveState: true);
  final _currentTokenResponse = AppStream<String>(preserveState: true);
}
