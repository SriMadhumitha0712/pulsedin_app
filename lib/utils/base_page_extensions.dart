import 'package:flutter/material.dart';
import 'package:pulsedin_app/base/base_page.dart';
import 'package:pulsedin_app/molecules/app_utils.dart';


extension PageExtensions on BaseStatefulPage {
  showShortToast(String message) {
    AppUtils.showToast(message);
  }

  showLongToast(String message) {
    AppUtils.showToast(message);
  }

  showSuccessMessage(String title) {
    AppUtils.showToast(
      title,
    );
  }

  showErrorMessage(String title) {
    AppUtils.showToast(
      title,
      color: Colors.red,
      //  webColor:  Colors.red,
    );
  }
}
