import 'package:domain/di/register_use_case_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulsedin_app/feature/register/register_page_view_model.dart';

final registerModuleProvider =
    ChangeNotifierProvider.autoDispose<RegisterPageViewModel>((ref) {
  return RegisterPageViewModel(ref.read(registerUseCaseProvider));
});
