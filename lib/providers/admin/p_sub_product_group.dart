import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/models/admin/sub_product_group/model_data_add.dart';
import 'package:pointofsales/models/admin/sub_product_group/model_data_edit_sub_produk_group.dart';
import 'package:pointofsales/models/admin/sub_product_group/model_list_sub_product_group.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';

class ProviderSubProductGroup with ChangeNotifier {
  late Response _response;
  BaseOptions options = new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  ModelListSubProductGroup? _modelListSubProductGroup;
  ModelDataEditSubProdukGroup? _modelDataEditSubProdukGroup;
  ModelDataAdd? _modelDataAdd;
  bool _isStatusActive = false;
  String? _produkGroupId;

  ModelListSubProductGroup? get modelListSubProductGroup =>
      _modelListSubProductGroup;

  set modelListSubProductGroup(ModelListSubProductGroup? value) {
    _modelListSubProductGroup = value;
    notifyListeners();
  }

  String? get produkGroupId => _produkGroupId;

  set produkGroupId(String? value) {
    _produkGroupId = value;
    notifyListeners();
  }

  ModelDataAdd? get modelDataAdd => _modelDataAdd;

  set modelDataAdd(ModelDataAdd? value) {
    _modelDataAdd = value;
    notifyListeners();
  }

  ModelDataEditSubProdukGroup? get modelDataEditSubProdukGroup =>
      _modelDataEditSubProdukGroup;

  set modelDataEditSubProdukGroup(ModelDataEditSubProdukGroup? value) {
    _modelDataEditSubProdukGroup = value;
    notifyListeners();
  }

  bool get isStatusActive => _isStatusActive;

  set isStatusActive(bool value) {
    _isStatusActive = value;
    notifyListeners();
  }

  Future<void> getListSubProductGroup(BuildContext context) async {
    Dio _dio = Dio(options);

    try {
      _response =
          await _dio.get(BaseUrl.getListSubProductGroup, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId()
      });
      modelListSubProductGroup =
          ModelListSubProductGroup.fromJson(_response.data);
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

  Future<void> getDataAdd(BuildContext context) async {
    Dio _dio = Dio(options);

    try {
      _response =
          await _dio.get(BaseUrl.postAddSubProdukGroup, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId()
      });
      modelDataAdd = ModelDataAdd.fromJson(_response.data);
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

  Future<void> postAddSubProductGroup(
      BuildContext context,
      String produkGroupId,
      String subProdukGroupNama,
      String subProdukGroupDesc) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postAddSubProdukGroup, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "produk_group_id": produkGroupId,
      "sub_produk_group_nama": subProdukGroupNama,
      "sub_produk_group_desc": subProdukGroupDesc,
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
                    getListSubProductGroup(context);
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

  Future<void> getDataEditSubProdukGroup(
      BuildContext context, String subProdukGroupId) async {
    Dio _dio = Dio(options);

    modelDataEditSubProdukGroup = null;

    try {
      _response =
          await _dio.get(BaseUrl.postEditSubProdukGroup, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "sub_produk_group_id": subProdukGroupId
      });
      modelDataEditSubProdukGroup =
          ModelDataEditSubProdukGroup.fromJson(_response.data);
      isStatusActive =
          (modelDataEditSubProdukGroup!.data!.result!.aktifSt == "1")
              ? true
              : false;
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

  Future<void> postEditSubProductGroup({
    required BuildContext context,
    required String subProdukGroupNama,
    required String subProdukGroupDesc,
    required String produkGroupId,
    required String activeStatus,
    required String subProdukGroupId,
  }) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postEditSubProdukGroup, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "sub_produk_group_nama": subProdukGroupNama,
      "sub_produk_group_desc": subProdukGroupDesc,
      "produk_group_id": produkGroupId,
      "aktif_st": activeStatus,
      "sub_produk_group_id": subProdukGroupId
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
                getListSubProductGroup(context);
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

  Future<void> postDeleteSubProductGroup(
      {required BuildContext context,
      required String subProductGroupId}) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    try {
      _response = await _dio.post(BaseUrl.postDeleteSubProdukGroup, data: {
        "user_id": await getUserId(),
        "role_id": await getRoleId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "sub_produk_group_id": subProductGroupId
      });
      if (_response.data['notif_st'] == true) {
        pg.dismiss();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
              onPressed: () {
                Navigator.pop(context);
                getListSubProductGroup(context);
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
