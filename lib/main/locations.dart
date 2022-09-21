import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:pulsedin_app/di/app_module.dart';
import 'package:pulsedin_app/feature/feed/feed_page.dart';
import 'package:pulsedin_app/feature/login/login_page.dart';
import 'package:pulsedin_app/feature/register/register_page.dart';
import 'package:pulsedin_app/main/custom_transition_page.dart';
import 'package:pulsedin_app/molecules/custom_text.dart';
import 'package:pulsedin_app/utils/enums.dart';
import 'package:pulsedin_app/utils/extensions.dart';

class BeamerRoutes {
  static final routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(beamLocations: [
      LoginLocation(),
      RegisterLocation(),
      FeedLocation(),
    ]),
    initialPath: "/login",
    notFoundPage: notFoundPage,
    guards: [
      BeamGuard(
        pathPatterns: ["/login", "/register", "/feed"],
        guardNonMatching: true,
        beamToNamed: (c, a) => "/login",
        check: (context, location) {
          final viewModel = context.read(appViewModelProvider);
          return viewModel.authState != AuthenticationStatus.UNAUTHENTICATED;
        },
      ),
    ],
  );
}

final notFoundPage = CustomTransitionPage(
  childWidget: routeNotFound(),
  pageTitle: "404 Not Found",
);

Widget routeNotFound() {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            width: 350,
            child: Image.asset(''
                // ImageResource.noRouteFound,
                ),
          ),
          const CustomText(
            "404 Not Found",
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    ),
  );
}

class LoginLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      CustomTransitionPage(
        key: const ValueKey("Login"),
        childWidget: const LoginPage(),
        pageTitle: "Login",
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ["/login"];
}

class RegisterLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      CustomTransitionPage(
        key: const ValueKey("Register"),
        childWidget: const RegisterPage(),
        pageTitle: "Register",
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ["/register"];
}

class FeedLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      CustomTransitionPage(
        key: const ValueKey("Feed"),
        childWidget: const FeedPage(),
        pageTitle: "Feed",
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ["/feed"];
}
