import 'package:beamer/beamer.dart';
import 'package:domain/bus/event_bus.dart';
import 'package:domain/bus/un_authenticated_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulsedin_app/base/base_widget.dart';
import 'package:pulsedin_app/di/app_module.dart';
import 'package:pulsedin_app/generated/l10n.dart';
import 'package:pulsedin_app/main/app_view_model.dart';
import 'package:pulsedin_app/main/locations.dart';
import 'package:pulsedin_app/molecules/scroll_behaviour.dart';

// ignore: must_be_immutable
class App extends ConsumerWidget {
  App({Key? key}) : super(key: key);
  bool isDoneInitialized = false;
  @override
  Widget build(context, ref) {
    return BaseWidget<AppViewModel>(
      providerBase: appViewModelProvider,
      onModelReady: (model) {
        model.authStateStream.listen((event) {
          if (isDoneInitialized) {
            model.currentToken.listen((event) {
              BeamerRoutes.routerDelegate.update();
            });
          }
          isDoneInitialized = true;
        });
        eventBus.on<UnAuthenticatedEvent>().listen((event) {
          model.logout();
        });
      },
      builder: (context, appModel, child) {
        return MaterialApp.router(
          routerDelegate: BeamerRoutes.routerDelegate,
          title: "Pulsedin",
          theme: ThemeData(primaryColor: Colors.white),
          debugShowCheckedModeBanner: false,
          routeInformationParser: BeamerParser(),
          scrollBehavior: MyCustomScrollBehavior(),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('en'),
          backButtonDispatcher:
              BeamerBackButtonDispatcher(delegate: BeamerRoutes.routerDelegate),
        );
      },
    );
  }
}
