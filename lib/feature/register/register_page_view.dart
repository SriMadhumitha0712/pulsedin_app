import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulsedin_app/base/base_page.dart';
import 'package:pulsedin_app/di/app_module.dart';
import 'package:pulsedin_app/di/register_module.dart';
import 'package:pulsedin_app/feature/register/register_page_view_model.dart';
import 'package:pulsedin_app/generated/l10n.dart';
import 'package:pulsedin_app/molecules/colour_resourse.dart';
import 'package:pulsedin_app/molecules/custom_text.dart';
import 'package:pulsedin_app/molecules/custom_text_field.dart';
import 'package:pulsedin_app/molecules/image_resourse.dart';
import 'package:pulsedin_app/utils/app_stream_builder.dart';
import 'package:pulsedin_app/utils/extensions.dart';
import 'package:pulsedin_app/utils/resource.dart';
import 'package:pulsedin_app/utils/status.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RegisterPageView extends BasePageViewWidget<RegisterPageViewModel> {
  const RegisterPageView(ProviderBase providerBase, {Key? key})
      : super(providerBase, key: key);

  @override
  Widget build(BuildContext context, RegisterPageViewModel model) {
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
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [ColorResource.blue, ColorResource.navyBlue],
        ),
      ),
      child: Column(
        children: const [Expanded(flex: 5, child: _RightPanel())],
      ),
    );
  }
}

class _RightPanel extends StatelessWidget {
  const _RightPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(registerModuleProvider);
    return Scaffold(
        body: Stack(children: [
      Column(
        children: [
          Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              gradient: RadialGradient(
                colors: [ColorResource.blue, ColorResource.navyBlue],
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageResourses.logo),
                    fit: BoxFit.scaleDown),
              ),
            ),
          ),
        ],
      ),
      Align(
        alignment: const Alignment(0, 0.40),
        child: SizedBox(
          width: 600,
          height: 550,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 148,
                  top: 20,
                  right: 148,
                ),
                child: CustomText(S.of(context).register,
                    fontSize: 22, fontWeight: FontWeight.bold),
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      top: 15,
                    ),
                    child: CustomText(
                      S.of(context).firstName,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 130,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 15,
                    ),
                    child: CustomText(
                      S.of(context).lastName,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 10, right: 15),
                      child: CustomTextField(
                        fillColor: ColorResource.greyText,
                        borderRadius: 30,
                        hintText: S.of(context).firstName,
                        controller: viewModel.firstNameController,
                        inputTextColor: ColorResource.COLOR_000000,
                        inputFontWeight: FontWeight.bold,
                        onFieldSubmitted: (value) =>
                            viewModel.triggerRegister(),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 15, top: 10),
                    child: CustomTextField(
                      fillColor: ColorResource.greyText,
                      borderRadius: 30,
                      hintText: S.of(context).lastName,
                      controller: viewModel.lastNameController,
                      inputTextColor: ColorResource.COLOR_000000,
                      inputFontWeight: FontWeight.bold,
                      onFieldSubmitted: (value) => viewModel.triggerRegister(),
                    ),
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, top: 17, right: 400),
                child: CustomText(
                  S.of(context).email,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17, top: 15),
                child: SizedBox(
                  height: 60,
                  width: 500,
                  child: CustomTextField(
                    fillColor: ColorResource.greyText,
                    borderRadius: 30,
                    hintText: S.of(context).enterYourEmail,
                    inputTextColor: ColorResource.COLOR_000000,
                    controller: viewModel.emailController,
                    onFieldSubmitted: (value) => viewModel.triggerRegister(),
                    inputFontWeight: FontWeight.bold,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, top: 17, right: 365),
                child: CustomText(
                  S.of(context).password,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 17, right: 17, top: 15),
                  child: SizedBox(
                    height: 60,
                    width: 500,
                    child: CustomTextField(
                      fillColor: ColorResource.greyText,
                      borderRadius: 30,
                      hintText: S.of(context).enterYourPassword,
                      controller: viewModel.passwordController,
                      inputTextColor: ColorResource.COLOR_000000,
                      inputFontWeight: FontWeight.bold,
                      onFieldSubmitted: (value) => viewModel.triggerRegister(),
                    ),
                  )),
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
                    viewModel.triggerRegister();
                    //context.beamToNamed('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    fixedSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: CustomText(S.of(context).register,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.34,
                      color: ColorResource.grey),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                onPressed: (() {
                  context.beamToNamed('/login');
                }),
                child: CustomText(S.of(context).haveAccount),
              ),
            ]),
          ),
        ),
      )
    ]));
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _RightPanel();
  }
}
