// ignore_for_file: depend_on_referenced_packages

import 'package:data/di/network_module.dart';
import 'package:data/repository/login_repository_impl.dart';
import 'package:riverpod/riverpod.dart';

var loginRepoProvider = Provider<LoginRepositoryImpl>(
  (ref) => LoginRepositoryImpl(
    ref.read(loginRemoteDSProvider),
  ),
);
