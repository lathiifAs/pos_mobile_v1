import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pointofsales/models/dapur/model_list_pesanan.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/network/base_dio.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';

class ProviderDapur extends ChangeNotifier with BaseDio {
  ModelListPesanan? _modelListPesanan;

  Future<void> getIndexWaiters(BuildContext context) async {
    try {
      response = await dio.get(BaseUrl.getListPesananDapur, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "parent_id": await getParentId(),
        "kitchen_id": await getKitchenId(),
      });
      modelListPesanan = ModelListPesanan.fromJson(response!.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        ScaffoldMessenger.of(context).showSnackBar(snackbarConnectTimeout);
      } else if (e.type == DioErrorType.receiveTimeout) {
        ScaffoldMessenger.of(context).showSnackBar(snackbarReceiveTimeout);
      } else if (e.type == DioErrorType.sendTimeout) {
        ScaffoldMessenger.of(context).showSnackBar(snackbarSendTimout);
      } else if (e.type == DioErrorType.other) {
        ScaffoldMessenger.of(context).showSnackBar(snackbarOther);
      }
    }
  }

  Future<void> postTokenFirebase(
      {required BuildContext context, required String tokenDevice}) async {
    response = await dio.post(BaseUrl.postTokenFirebase, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "token_device": tokenDevice,
    });

    try {
      if (response!.data['notif_st'] == false) {
        showSnackBar(
            snackBarType: SnackBarType.ERROR,
            title: 'Error',
            message: response!.data['notif_msg']);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        ScaffoldMessenger.of(context).showSnackBar(snackbarConnectTimeout);
      } else if (e.type == DioErrorType.receiveTimeout) {
        ScaffoldMessenger.of(context).showSnackBar(snackbarReceiveTimeout);
      } else if (e.type == DioErrorType.sendTimeout) {
        ScaffoldMessenger.of(context).showSnackBar(snackbarSendTimout);
      } else if (e.type == DioErrorType.other) {
        ScaffoldMessenger.of(context).showSnackBar(snackbarOther);
      }
    }
  }

  ModelListPesanan? get modelListPesanan => _modelListPesanan;

  set modelListPesanan(ModelListPesanan? value) {
    _modelListPesanan = value;
    notifyListeners();
  }
}
