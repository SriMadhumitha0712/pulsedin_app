import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulsedin_app/base/base_page.dart';
import 'package:pulsedin_app/di/app_module.dart';
import 'package:pulsedin_app/di/login_module.dart';
import 'package:pulsedin_app/feature/login/login_page_view_model.dart';
import 'package:pulsedin_app/generated/l10n.dart';
import 'package:pulsedin_app/molecules/colour_resourse.dart';
import 'package:pulsedin_app/molecules/custom_text.dart';
import 'package:pulsedin_app/utils/app_stream_builder.dart';
import 'package:pulsedin_app/utils/extensions.dart';
import 'package:pulsedin_app/utils/resource.dart';
import 'package:pulsedin_app/utils/status.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPageView extends BasePageViewWidget<LoginPageViewModel> {
  const LoginPageView(ProviderBase providerBase, {Key? key})
      : super(providerBase, key: key);

  @override
  Widget build(BuildContext context, LoginPageViewModel model) {
    return AppStreamBuilder<Resource<bool>>(
        stream: model.isLoggedIn,
        initialData: Resource.success(data: false),
        dataBuilder: (context, snapshot) {
          if (snapshot!.status == Status.SUCCESS && snapshot.data!) {
            context.read(appViewModelProvider).login();
          }
          return ScreenTypeLayout.builder(
            desktop: (BuildContext context) => const _WebLayout(),
            mobile: (BuildContext context) => const _MobileLayout(),
            tablet: (BuildContext context) => const _MobileLayout(),
          );
        });
  }
}

class _WebLayout extends StatelessWidget {
  const _WebLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        children: const [Expanded(flex: 5, child: _RightPanel())],
      ),
    );
  }
}

class _LeftPanel extends StatelessWidget {
  const _LeftPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // decoration:
      //          BoxDecoration(gradient: ColorResource.loginBackgroundGradient),
//       child: SingleChildScrollView(
//         clipBehavior: Clip.antiAlias,
//         physics: const NeverScrollableScrollPhysics(),
//         controller: ScrollController(),
//         child: Column(children: [
//           const SizedBox(height: 100),
//           CustomText(
//             S.of(context).forEducators,
//             fontSize: 54,
//             fontWeight: FontWeight.bold,
//             color: ColorResource.COLOR_FFFFFF,
//           ),
//           const SizedBox(height: 25),
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 120),
//             child: CustomText(
//               S.of(context).ourMissionIs,
//               fontSize: 24,
//               color: ColorResource.COLOR_FFFFFF,
//               textAlign: TextAlign.center,
//             ),
//           ),
//           const SizedBox(height: 30),
//           Image.asset(ImageResource.loginBackDrop),
//         ]),
//       ),
    );
  }
}

class _RightPanel extends StatelessWidget {
  const _RightPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(loginModuleProvider);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 289,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  gradient: RadialGradient(
                    colors: [ColorResource.blue, ColorResource.navyBlue],
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(''
                            // ImageResourses.logo
                            ),
                        fit: BoxFit.scaleDown),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: const Alignment(0, 0.20),
            child: SizedBox(
              width: 500,
              height: 500,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 157,
                        top: 20,
                        right: 157,
                      ),
                      child: Text(
                        'login',
                        // StringResourses.login,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 20,
                      thickness: 0.5,
                      endIndent: 0,
                      color: Colors.grey,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 17, top: 20, right: 285),
                      child: Text(
                        'Email',
                        //StringResourses.emailId,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 17, right: 17, top: 15),
                      child: TextFormField(
                        controller: viewModel.emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorResource.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          // hintText: StringResourses.hintEmailId,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 17,
                        top: 20,
                        right: 285,
                      ),
                      child: Text(
                        'password',
                        //StringResourses.password,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 17, right: 17, top: 15),
                      child: TextFormField(
                        obscureText: true,
                        controller: viewModel.passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorResource.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          // hintText: StringResourses.hintPassword,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 234,
                        top: 20,
                        right: 6,
                      ),
                      child: Text(
                        'forget password',
                        //StringResourses.forgot,
                        style: TextStyle(
                            fontSize: 16, color: ColorResource.orange),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 4),
                              blurRadius: 5.0)
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.0, 1.0],
                          colors: [
                            ColorResource.lightBlue,
                            ColorResource.darkBlue,
                          ],
                        ),
                        color: ColorResource.darkBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          //loginCubit.onLoginButtonPressed();
                          //Navigator.pushNamed(context, Routes.feedScreen);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          fixedSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          // StringResourses.login,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.34,
                              color: ColorResource.grey),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        textStyle: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      onPressed: (() {
                        // Navigator.pushNamed(context, Routes.registerScreen);
                      }),
                      child: const Text('StringResourses.dontHaveAccount'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _RightPanel();
  }
}
