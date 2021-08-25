import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void config() {
  EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.cubeGrid;
  EasyLoading.instance
    ..backgroundColor = Colors.green.withOpacity(.8)
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..radius = 12
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..progressColor = Colors.white
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..displayDuration = const Duration(seconds: 3)
    ..maskColor = Colors.green.withOpacity(.2);
}

void showLoaging() {
  EasyLoading.instance..backgroundColor = Colors.green.withOpacity(.8);
  EasyLoading.show(status: 'Loading...', maskType: EasyLoadingMaskType.custom);
}

void showSuccess() {
  EasyLoading.instance..backgroundColor = Colors.green.withOpacity(.8);
  EasyLoading.showSuccess('Login Successfully',
      maskType: EasyLoadingMaskType.custom);
}

void showError({@required String? error}) {
  EasyLoading.instance
    ..backgroundColor = Colors.red.withOpacity(.7)
    ..maskColor = Colors.green.withOpacity(.2);
  EasyLoading.showError(error.toString(), maskType: EasyLoadingMaskType.custom);
}

void showLoagingWithProgress({String? message, double? progress}) {
  EasyLoading.instance..backgroundColor = Colors.green.withOpacity(.8);
  EasyLoading.showProgress(progress!,
      status: message ?? 'Loading...', maskType: EasyLoadingMaskType.custom);
}
