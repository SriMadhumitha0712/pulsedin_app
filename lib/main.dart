
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulsedin_app/main/app.dart';

// import './main/configure_non_web.dart'
//     if (dart.library.html) './main/configure_web.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // configureApp();
  runApp(ProviderScope(
    child: App(),
  ));
}
