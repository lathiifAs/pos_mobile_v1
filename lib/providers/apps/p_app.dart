import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:pointofsales/utils/network/base_dio.dart';


class ProviderApp extends ChangeNotifier with BaseDio {

  AppUpdateInfo? _updateInfo;

  bool _flexibleUpdateAvailable = false;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      _updateInfo = info;
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.performImmediateUpdate()
            .catchError((onError) => print(onError));
      }
    }).catchError((e) {
      print(e);
    });
  }
}
