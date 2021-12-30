import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pointofsales/utils/constants.dart';

Future<dynamic> loadingBuilder({required String title}) {
  return Get.dialog(
    Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      child: Container(
        height: 60,
        width: 150,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: kBackgroundColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              height: 20.0,
              width: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    "$title",
                    style: blackTextStyle,
                  )),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
