import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoaging() {
  EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.cubeGrid;
  EasyLoading.instance
    ..backgroundColor = Colors.green.withOpacity(.8)
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..radius = 12
    ..displayDuration = const Duration(seconds: 3)
    ..maskColor = Colors.green.withOpacity(.2);
  EasyLoading.show(status: 'Loading...', maskType: EasyLoadingMaskType.custom);
}

void showSuccess() {
  EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.cubeGrid;
  EasyLoading.instance
    ..backgroundColor = Colors.green.withOpacity(.8)
    ..indicatorColor = Colors.white
    ..radius = 12
    ..displayDuration = const Duration(seconds: 3)
    ..textColor = Colors.white
    ..maskColor = Colors.green.withOpacity(.2);

  EasyLoading.showSuccess('Login Successfully',
      maskType: EasyLoadingMaskType.custom);
}

void showError({@required String? error}) {
  EasyLoading.instance..backgroundColor = Colors.red.withOpacity(.2);

  EasyLoading.showError(error.toString(), maskType: EasyLoadingMaskType.custom);
}

void showLoagingWithProgress({String? message, double? progress}) {
  // EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.cubeGrid;

  EasyLoading.instance
    ..backgroundColor = Colors.green.withOpacity(.8)
    ..indicatorColor = Colors.white
    ..radius = 12
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..textColor = Colors.white
    ..progressColor = Colors.white
    ..maskColor = Colors.green.withOpacity(.2);
  EasyLoading.showProgress(progress!,
      status: message ?? 'Loading...', maskType: EasyLoadingMaskType.custom);
}

easyLoadingConfig() {
  EasyLoading.instance
    ..backgroundColor = Colors.green.withOpacity(.8)
    ..indicatorColor = Colors.white
    ..radius = 12
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..textColor = Colors.white
    ..progressColor = Colors.white
    ..maskColor = Colors.green.withOpacity(.2);
}
