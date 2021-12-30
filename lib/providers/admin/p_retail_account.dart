import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/models/admin/retail_account/model_data_add.dart';
import 'package:pointofsales/models/admin/retail_account/model_detail_retail_akun.dart';
import 'package:pointofsales/models/admin/retail_account/model_list_akun_by_retail.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/network/base_dio.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProviderRetailAccount extends ChangeNotifier with BaseDio {
  ModelListAkunByRetail? _modelListAkunByRetail;
  ModelDataAdd? _modelDataAdd;
  ModelDetailRetailAkun? _modelDetailRetailAkun;

  String? tanggalLahir;
  bool? userStatus;

  Future<void> getTanggalLahir(DateRangePickerSelectionChangedArgs args) async {
    tanggalLahir = DateFormat('yyyy-MM-dd').format(args.value).toString();
  }

  Future<void> getListAkun(
      {required BuildContext context, required String parentId}) async {
    try {
      response = await dio.get(BaseUrl.getListAkunByRetail, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "parent_id": parentId
      });
      modelListAkunByRetail = ModelListAkunByRetail.fromJson(response!.data);
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

  Future<void> getDataAdd(
      {required BuildContext context, required String parentId}) async {
    try {
      response = await dio.get(BaseUrl.getDataAddRetailAkun, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "parent_id": parentId
      });
      modelDataAdd = ModelDataAdd.fromJson(response!.data);
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

  Future<void> getDetailRetailAkun(
      {required BuildContext context, required String inputUserId}) async {
    try {
      response = await dio.get(BaseUrl.getDetailRetailAkun, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "input_user_id": inputUserId
      });
      modelDetailRetailAkun = ModelDetailRetailAkun.fromJson(response!.data);
      userStatus =
          (modelDetailRetailAkun!.data!.result!.userSt == "1") ? true : false;
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

  Future<void> postAddRetailAkun({
    required BuildContext context,
    required String userName,
    required String userPass,
    required String email,
    required String nama,
    required String noHp,
    required String alamatLengkap,
    required String tglLahir,
    required String noNik,
    required String noNpwp,
    required String inputRoleId,
    required String parentId,
  }) async {
    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    response = await dio.post(BaseUrl.getDataAddRetailAkun, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "user_name": userName,
      "user_pass": userPass,
      "email": email,
      "nama": nama,
      "no_hp": noHp,
      "alamat_lengkap": alamatLengkap,
      "tgl_lahir": tglLahir,
      "no_nik": noNik,
      "no_npwp": noNpwp,
      "input_role_id": inputRoleId
    });

    try {
      if (response!.data['notif_st'] == true) {
        pg.dismiss();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Navigator.pop(context);
                    getListAkun(context: context, parentId: parentId);
                  },
                  descriptions: response!.data['notif_msg'],
                ));
      } else {
        pg.dismiss();
        showSnackBar(
            snackBarType: SnackBarType.ERROR,
            title: "Error",
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

  Future<void> postDeleteRetailAccount(
      {required BuildContext context,
      required String inputUserId,
      required String parentId}) async {
    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please Wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();
    response = await dio.post(BaseUrl.postDeleteRetailAkun, data: {
      "user_id": await getUserId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "role_id": await getRoleId(),
      "input_user_id": inputUserId,
    });

    try {
      if (response!.data['notif_st'] == true) {
        pg.dismiss();

        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Navigator.pop(context);
                    getListAkun(context: context, parentId: parentId);
                  },
                  descriptions: response!.data['notif_msg'],
                ));
      } else {
        pg.dismiss();
        showSnackBar(
            snackBarType: SnackBarType.ERROR,
            title: "Error",
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

  Future<void> postEditRetailAkun({
    required BuildContext context,
    required String userName,
    required String userPass,
    required String email,
    required String nama,
    required String noHp,
    required String alamatLengkap,
    required String tglLahir,
    required String nik,
    required String npwp,
    required String inputUserId,
    required String userSt,
  }) async {
    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please Wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();
    response = await dio.post(BaseUrl.getDetailRetailAkun, data: {
      "user_id": await getUserId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "role_id": await getRoleId(),
      "user_name": userName,
      "user_pass": userPass,
      "email": email,
      "nama": nama,
      "no_hp": noHp,
      "alamat_lengkap": alamatLengkap,
      "tgl_lahir": tglLahir,
      "no_nik": nik,
      "no_npwp": npwp,
      "input_user_id": inputUserId,
      "user_st": userSt,
    });
    try {
      if (response!.data['notif_st'] == true) {
        pg.dismiss();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Navigator.pop(context);

                  },
                  descriptions: response!.data['notif_msg'],
                ));
      } else {
        pg.dismiss();
        showSnackBar(
            snackBarType: SnackBarType.ERROR,
            title: "Error",
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

  ModelListAkunByRetail? get modelListAkunByRetail => _modelListAkunByRetail;

  set modelListAkunByRetail(ModelListAkunByRetail? value) {
    _modelListAkunByRetail = value;
    notifyListeners();
  }

  ModelDataAdd? get modelDataAdd => _modelDataAdd;

  set modelDataAdd(ModelDataAdd? value) {
    _modelDataAdd = value;
    notifyListeners();
  }

  ModelDetailRetailAkun? get modelDetailRetailAkun => _modelDetailRetailAkun;

  set modelDetailRetailAkun(ModelDetailRetailAkun? value) {
    _modelDetailRetailAkun = value;
    notifyListeners();
  }
}
