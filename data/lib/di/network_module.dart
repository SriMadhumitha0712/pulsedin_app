// ignore_for_file: depend_on_referenced_packages

import 'package:data/network/api_helper.dart';
import 'package:data/network/api_service.dart';
import 'package:data/source/remote/login_ds_impl.dart';
import 'package:data/source/remote/register_ds_impl.dart';
import 'package:riverpod/riverpod.dart';

final dioProvider = Provider<DioHelper>(
  (ref) {
    DioHelper dio = DioHelper();
    return dio;
  },
);

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiService(
    ref.read(dioProvider).dio,
  ),
);

final loginRemoteDSProvider = Provider<LoginRemoteDSImpl>(
  (ref) => LoginRemoteDSImpl(
    ref.read(apiServiceProvider),
  ),
);
final registerRemoteDSProvider = Provider<RegisterRemoteDSImpl>(
  (ref) => RegisterRemoteDSImpl(
    ref.read(apiServiceProvider),
  ),
);
