import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'general_button.dart';

Future<dynamic> showDialogQuestion(
    {required String title,
    required String message,
    required VoidCallback clickYes}) {
  return Get.dialog(
    AlertDialog(
      title: Text(title),
      content: Text(message),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      actions: [
        GeneralButton(height: 30, width: 60, label: 'Yes', onPressed: clickYes, color: kButtonColor,),
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'No',
              style: blackTextStyle,
            ))
      ],
    ),
  );
}
