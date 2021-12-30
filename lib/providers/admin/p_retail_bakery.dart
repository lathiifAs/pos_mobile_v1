import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/models/admin/retail_bakery/model_retail_bakery.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';

class ProviderRetailBakery with ChangeNotifier {
  late Response _response;
  BaseOptions _options =
      BaseOptions(connectTimeout: 5000, receiveTimeout: 3000);
  ModelRetailBakery? _modelRetailBakery;
  bool _isStatusActive = false;

  bool get isStatusActive => _isStatusActive;

  set isStatusActive(bool value) {
    _isStatusActive = value;
    notifyListeners();
  }

  ModelRetailBakery? get modelRetailBakery => _modelRetailBakery;

  set modelRetailBakery(ModelRetailBakery? value) {
    _modelRetailBakery = value;
    notifyListeners();
  }

  Future<void> getListRetailBakery(BuildContext context) async {
    Dio _dio = Dio(_options);
    try {
      _response = await _dio.get(BaseUrl.getListRetailBakery, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId()
      });

      modelRetailBakery = ModelRetailBakery.fromJson(_response.data);
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

  Future<void> postAddRetailBakery(
      BuildContext context, String namaRetail, String descRetail) async {
    Dio _dio = Dio(_options);
    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please Wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();
    _response = await _dio.post(BaseUrl.postAddRetail, data: {
      "user_id": await getUserId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "role_id": await getRoleId(),
      "nama_retail": namaRetail,
      "keterangan": descRetail
    });
    try {
      if (_response.data['notif_st'] == true) {
        pg.dismiss();

        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Navigator.pop(context);
                    getListRetailBakery(context);
                  },
                  descriptions: _response.data['notif_msg'],
                ));
      } else {
        pg.dismiss();
        showSnackBar(
            snackBarType: SnackBarType.ERROR,
            title: "Error",
            message: _response.data['notif_msg']);
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

  Future<void> postEditRetailBakery(
      {required BuildContext context,
      required String namaRetail,
      required String keterangan,
      required String aktifStatus,
      required String inputRoleId}) async {
    Dio _dio = Dio(_options);
    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please Wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();
    _response = await _dio.post(BaseUrl.posteditRetail, data: {
      "user_id": await getUserId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "role_id": await getRoleId(),
      "nama_retail": namaRetail,
      "keterangan": keterangan,
      "aktif_st": aktifStatus,
      "input_role_id": inputRoleId,
    });
    try {
      if (_response.data['notif_st'] == true) {
        pg.dismiss();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Navigator.pop(context);
                    getListRetailBakery(context);
                  },
                  descriptions: _response.data['notif_msg'],
                ));
      } else {
        pg.dismiss();
        showSnackBar(
            snackBarType: SnackBarType.ERROR,
            title: "Error",
            message: _response.data['notif_msg']);
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

  Future<void> postDeleteRetail(
      {required BuildContext context, required String inputRoleId}) async {
    Dio _dio = Dio(_options);
    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please Wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();
    _response = await _dio.post(BaseUrl.postDeleteRetail, data: {
      "user_id": await getUserId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "role_id": await getRoleId(),
      "input_role_id": inputRoleId,
    });

    try {
      if (_response.data['notif_st'] == true) {
        pg.dismiss();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Navigator.pop(context);
                    getListRetailBakery(context);
                  },
                  descriptions: _response.data['notif_msg'],
                ));
      } else {
        pg.dismiss();
        showSnackBar(
            snackBarType: SnackBarType.ERROR,
            title: "Error",
            message: _response.data['notif_msg']);
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
}
