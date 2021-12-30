import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pointofsales/utils/constants.dart';

import 'enum.dart';

void showSnackBar(
    {String? title, String? message, required SnackBarType snackBarType}) {
  switch (snackBarType) {
    case SnackBarType.SUCCESS:
      return Get.snackbar(
        "$title",
        "$message",
        backgroundColor: Colors.blue,
        colorText: kBackgroundColor,
        barBlur: 3,
        icon: Icon(Icons.check_circle, color: kBackgroundColor),
        snackStyle: SnackStyle.FLOATING,
      );
    case SnackBarType.ERROR:
      return Get.snackbar(
        "$title",
        "$message",
        backgroundColor: Colors.red,
        colorText: kBackgroundColor,
        barBlur: 3,
        icon: Icon(
          Icons.error,
          color: kBackgroundColor,
        ),
        snackStyle: SnackStyle.FLOATING,
      );
    case SnackBarType.INFO:
      return Get.snackbar(
        "$title",
        "$message",
        backgroundColor: colorBlue,
        colorText: kBackgroundColor,
        barBlur: 3,
        icon: Icon(
          Icons.info,
          color: kBackgroundColor,
        ),
        snackStyle: SnackStyle.FLOATING,
      );
    case SnackBarType.WARNING:
      return Get.snackbar(
        "$title",
        "$message",
        backgroundColor: colorYellow,
        colorText: kBackgroundColor,
        barBlur: 3,
        icon: Icon(
          Icons.warning_rounded,
          color: kBackgroundColor,
        ),
        snackStyle: SnackStyle.FLOATING,
      );

    default:
      return Get.snackbar("$title", "$message");
  }
}
