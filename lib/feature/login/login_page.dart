
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulsedin_app/base/base_page.dart';
import 'package:pulsedin_app/di/login_module.dart';
import 'package:pulsedin_app/feature/login/login_page_view.dart';
import 'package:pulsedin_app/feature/login/login_page_view_model.dart';

class LoginPage extends BasePage<LoginPageViewModel> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends BaseStatefulPage<LoginPageViewModel, LoginPage> {
  @override
  ProviderBase provideBase() {
    return loginModuleProvider;
  }

  @override
  bool extendBodyBehindAppBar() {
    return true;
  }

  @override
  void onModelReady(LoginPageViewModel model) {
    super.onModelReady(model);
  }

  @override
  Widget buildView(BuildContext context, LoginPageViewModel model) {
    return LoginPageView(provideBase());
  }
}
