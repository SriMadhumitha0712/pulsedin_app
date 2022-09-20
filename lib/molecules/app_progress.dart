
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pulsedin_app/molecules/colour_resourse.dart';

class AppProgress {
  AppProgress(BuildContext context) {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        useSafeArea: true,
        barrierColor: ColorResource.COLOR_000000.withOpacity(0.7),
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Center(
                child: SizedBox(
              child: LoadingAnimationWidget.discreteCircle(
                color: Colors.white,
                size: 110,
                // secondRingColor: ColorResource.COLOR_7D72FF,
                // thirdRingColor: ColorResource.COLOR_3CDABD,
              ),
            )),
          );
        });
  }
}
