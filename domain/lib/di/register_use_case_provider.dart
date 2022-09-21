import 'package:data/di/repository_module.dart';
import 'package:domain/usecase/register/register_usecase.dart';
import 'package:riverpod/riverpod.dart';

final registerUseCaseProvider = Provider.autoDispose<RegisterUseCase>(
  (ref) => RegisterUseCase(ref.read(registerRepoProvider)),
);
