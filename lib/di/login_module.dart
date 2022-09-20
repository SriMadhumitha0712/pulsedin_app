import 'package:domain/di/login_use_case_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulsedin_app/feature/login/login_page_view_model.dart';

final loginModuleProvider =
    ChangeNotifierProvider.autoDispose<LoginPageViewModel>((ref) {
  return LoginPageViewModel(ref.read(loginUseCaseProvider));
});
