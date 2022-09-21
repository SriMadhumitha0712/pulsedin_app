
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulsedin_app/base/base_page.dart';
import 'package:pulsedin_app/di/register_module.dart';
import 'package:pulsedin_app/feature/register/register_page_view.dart';
import 'package:pulsedin_app/feature/register/register_page_view_model.dart';

class RegisterPage extends BasePage<RegisterPageViewModel> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends BaseStatefulPage<RegisterPageViewModel, RegisterPage> {
  @override
  ProviderBase provideBase() {
    return registerModuleProvider;
  }

  @override
  bool extendBodyBehindAppBar() {
    return true;
  }

  @override
  void onModelReady(RegisterPageViewModel model) {
    super.onModelReady(model);
  }

  @override
  Widget buildView(BuildContext context, RegisterPageViewModel model) {
    return RegisterPageView(provideBase());
  }
}