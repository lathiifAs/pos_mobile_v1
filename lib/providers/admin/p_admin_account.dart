import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/models/ADMIN/admin_account/model_data_edit_akun_admin.dart';
import 'package:pointofsales/models/ADMIN/admin_account/model_list_akun_admin.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProviderAdminAccount with ChangeNotifier {
  late Response _response;
  BaseOptions options = new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  ModelListAkunAdmin? _modelListAkunAdmin;
  ModelDataEditAkunAdmin? _modelDataEditAkunAdmin;
  bool _userStatus = false;
  String? _tanggalLahir;

  ModelListAkunAdmin? get modelListAkunAdmin => _modelListAkunAdmin;

  set modelListAkunAdmin(ModelListAkunAdmin? value) {
    _modelListAkunAdmin = value;
    notifyListeners();
  }

  String? get tanggalLahir => _tanggalLahir;

  set tanggalLahir(String? value) {
    _tanggalLahir = value;
    notifyListeners();
  }

  ModelDataEditAkunAdmin? get modelDataEditAkunAdmin => _modelDataEditAkunAdmin;

  set modelDataEditAkunAdmin(ModelDataEditAkunAdmin? value) {
    _modelDataEditAkunAdmin = value;
    notifyListeners();
  }

  bool get userStatus => _userStatus;

  set userStatus(bool value) {
    _userStatus = value;
    notifyListeners();
  }

  Future<void> getTanggalLahir(DateRangePickerSelectionChangedArgs args) async {
    tanggalLahir = DateFormat('yyyy-MM-dd').format(args.value).toString();
  }

  Future<void> getListAkunAdmin(BuildContext context) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getListAkunAdmin, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId()
      });
      modelListAkunAdmin = ModelListAkunAdmin.fromJson(_response.data);
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

  Future<void> getDetailAkunAdmin(BuildContext context, String userId) async {
    Dio _dio = Dio(options);

    modelDataEditAkunAdmin = null;

    try {
      _response = await _dio.get(BaseUrl.postEditAkunAdmin, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "input_user_id": userId,
      });

      modelDataEditAkunAdmin = ModelDataEditAkunAdmin.fromJson(_response.data);
      if (_response.data['notif_st'] == true) {
        userStatus = (modelDataEditAkunAdmin!.data!.result!.userSt == "1")
            ? true
            : false;
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

  Future<void> postAddAdminAccount(
      BuildContext context,
      String userName,
      String userPass,
      String email,
      String nama,
      String noHp,
      String alamatLengkap,
      String tglLahir,
      String noNik,
      String noNpwp) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postAddAkunAdmin, data: {
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
                    getListAkunAdmin(context);
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

  Future<void> postDeleteAkunAdmin(
      {required BuildContext context, required String inputUserId}) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postDeleteAkunAdmin, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "input_user_id": inputUserId
    });

    try {
      if (_response.data['notif_st'] == true) {
        pg.dismiss();
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Navigator.pop(context);
                    getListAkunAdmin(context);
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

  Future<void> postEditAkunAdmin(
      BuildContext context,
      String userName,
      String userPass,
      String email,
      String nama,
      String noHp,
      String alamatLengkap,
      String tglLahir,
      String noNik,
      String noNpwp,
      String userSt,
      String inputUserId) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postEditAkunAdmin, data: {
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
      "user_st": userSt,
      "input_user_id": inputUserId
    });

    try {
      if (_response.data['notif_st'] == true) {
        pg.dismiss();
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Navigator.pop(context);
                    getListAkunAdmin(context);
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
