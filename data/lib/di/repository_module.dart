// ignore_for_file: depend_on_referenced_packages

import 'package:data/di/network_module.dart';
import 'package:data/repository/feed_repository_impl.dart';
import 'package:data/repository/login_repository_impl.dart';
import 'package:data/repository/register_repository_impl.dart';
import 'package:riverpod/riverpod.dart';

var loginRepoProvider = Provider<LoginRepositoryImpl>(
  (ref) => LoginRepositoryImpl(
    ref.read(loginRemoteDSProvider),
  ),
);

var registerRepoProvider = Provider<RegisterRepositoryImpl>(
  (ref) => RegisterRepositoryImpl(
    ref.read(registerRemoteDSProvider),
  ),
);

var feedRepoProvider = Provider<FeedRepositoryImpl>(
  (ref) => FeedRepositoryImpl(
    ref.read(feedRemoteDSProvider),
  ),
);