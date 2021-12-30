import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/models/admin/kitchen/model_data_edit.dart';
import 'package:pointofsales/models/admin/kitchen/model_list_kitchen.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';

class ProviderKitchen with ChangeNotifier {
  late Response _response;
  BaseOptions options = new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  ModelListKitchen? _modelListKitchen;
  ModelDataEdit? _modelDataEdit;

  Future<void> getListKitchen(BuildContext context) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getListKitchen, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId()
      });
      modelListKitchen = ModelListKitchen.fromJson(_response.data);
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

  Future<void> getDataEdit(BuildContext context, String kitchenId) async {
    Dio _dio = Dio(options);

    modelDataEdit = null;

    try {
      _response = await _dio.get(BaseUrl.postEditKitchen, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "kitchen_id": kitchenId
      });
      modelDataEdit = ModelDataEdit.fromJson(_response.data);
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

  Future<void> postAddKitchen(
      BuildContext context, String kitchenName, String kitchenDesc) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postAddKitchen, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "kitchen_nama": kitchenName,
      "kitchen_deskripsi": kitchenDesc
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
                    getListKitchen(context);
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

  Future<void> postEditKitchen(BuildContext context, String kitchenName,
      String kitchenDesc, String kitchenId) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postEditKitchen, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "kitchen_nama": kitchenName,
      "kitchen_deskripsi": kitchenDesc,
      "kitchen_id": kitchenId
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
                    getListKitchen(context);
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

  Future<void> postDeleteKitchen(BuildContext context, String kitchenId) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postDeleteKitchen, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "kitchen_id": kitchenId
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
                    getListKitchen(context);
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

  ModelDataEdit? get modelDataEdit => _modelDataEdit;

  set modelDataEdit(ModelDataEdit? value) {
    _modelDataEdit = value;
    notifyListeners();
  }

  ModelListKitchen? get modelListKitchen => _modelListKitchen;

  set modelListKitchen(ModelListKitchen? value) {
    _modelListKitchen = value;
    notifyListeners();
  }
}
