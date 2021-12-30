import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/models/admin/sales_group/model_sales_group.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';

class ProviderSalesGroup with ChangeNotifier {
  late Response _response;
  BaseOptions options = new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  ModelSalesGroup? _modelSalesGroup;
  bool _isStatusActive = false;
  String? _groupId;

  ModelSalesGroup? get modelSalesGroup => _modelSalesGroup;

  set modelSalesGroup(ModelSalesGroup? value) {
    _modelSalesGroup = value;
    notifyListeners();
  }

  bool get isStatusActive => _isStatusActive;

  set isStatusActive(bool value) {
    _isStatusActive = value;
    notifyListeners();
  }

  String? get groupId => _groupId;

  set groupId(String? value) {
    _groupId = value;
    notifyListeners();
  }

  Future<void> getListSalesGroup(BuildContext context) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getListSalesGroup, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId()
      });
      modelSalesGroup = ModelSalesGroup.fromJson(_response.data);
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

  Future<void> postAddSalesGroup(BuildContext context, String salesGroupName,
      String salesGroupDesc, String groupId) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postAddSalesGroup, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "sales_group_nama": salesGroupName,
      "sales_group_desc": salesGroupDesc,
      "group_id": groupId,
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
                getListSalesGroup(context);
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

  Future<void> postEditSalesGroup({
    required BuildContext context,
    required String salesGroupName,
    required String salesGroupDesc,
    required String groupId,
    required String activeStatus,
    required String salesGroupId,
  }) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postEditSalesGroup, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "sales_group_nama": salesGroupName,
      "sales_group_desc": salesGroupDesc,
      "group_id": groupId,
      "aktif_st": activeStatus,
      "sales_group_id": salesGroupId
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
                getListSalesGroup(context);
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

  Future<void> postDeleteSalesGroup(
      {required BuildContext context, required String salesGroupId}) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postDeleteSalesGroup, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "sales_group_id": salesGroupId
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
                getListSalesGroup(context);
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
