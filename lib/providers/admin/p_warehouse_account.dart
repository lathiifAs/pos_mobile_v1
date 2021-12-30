import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/models/admin/warehouse/warehouse_account/model_data_edit_warehouse.dart';
import 'package:pointofsales/models/admin/warehouse/warehouse_account/model_list_add_gudang.dart';
import 'package:pointofsales/models/admin/warehouse/warehouse_account/model_warehose_account.dart';

import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProviderWarehouseAccount with ChangeNotifier {
  late Response _response;
  BaseOptions options = new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  ModelWarehoseAccount? _modelWarehoseAccount;
  ModelListAddGudang? _modelListAddGudang;
  ModelDataEditWarehouse? _modelDataEditWarehouse;
  String? _tanggalLahir;
  String? _roleId;
  bool? _userStatus;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _alamatLengkapController = TextEditingController();
  TextEditingController _noHPController = TextEditingController();
  TextEditingController _noNikController = TextEditingController();
  TextEditingController _noNpwpController = TextEditingController();
  TextEditingController _tglLahirController = TextEditingController();

  Future<void> getTanggalLahir(DateRangePickerSelectionChangedArgs args) async {
    tanggalLahir = DateFormat('yyyy-MM-dd').format(args.value).toString();
  }

  Future<void> getListWarehouseAccount(BuildContext context) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getListAkunGudang, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
      });
      modelWarehoseAccount = ModelWarehoseAccount.fromJson(_response.data);
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

  Future<void> getAddAkunGudang(BuildContext context) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.postAddAkunGudang, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
      });
      modelListAddGudang = ModelListAddGudang.fromJson(_response.data);
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

  Future<void> getDetailAkunGudang(
      BuildContext context, String inputUserId, String inputRoleId) async {
    Dio _dio = Dio(options);

    modelDataEditWarehouse = null;

    try {
      _response = await _dio.get(BaseUrl.getEditAkunGudang, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "input_user_id": inputUserId,
        "input_role_id": inputRoleId
      });

      modelDataEditWarehouse = ModelDataEditWarehouse.fromJson(_response.data);
      if (_response.data['notif_st'] == true) {
        userStatus = (modelDataEditWarehouse!.data!.result!.userSt == "1")
            ? true
            : false;
      }
      usernameController.text = modelDataEditWarehouse!.data!.result!.userName!;
      namaController.text = modelDataEditWarehouse!.data!.result!.nama!;
      emailController.text = modelDataEditWarehouse!.data!.result!.email!;
      alamatLengkapController.text =
          modelDataEditWarehouse!.data!.result!.alamatLengkap!;
      noHPController.text = modelDataEditWarehouse!.data!.result!.noHp!;
      noNikController.text = modelDataEditWarehouse!.data!.result!.noNik!;
      noNpwpController.text = modelDataEditWarehouse!.data!.result!.noNpwp!;
      tanggalLahir =
          modelDataEditWarehouse!.data!.result!.tglLahir!.substring(0, 10);
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

  Future<void> postAddWarehouseAccount(
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
      String inputRoleId) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postAddAkunGudang, data: {
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
      if (_response.data['notif_st'] == true) {
        pg.dismiss();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Navigator.pop(context);
                    getListWarehouseAccount(context);
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

  Future<void> postEditAkunGudang(
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
      String inputRoleId,
      String inputUserId) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postEditAkunGudang, data: {
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
      "input_role_id": inputRoleId,
      "input_user_id": inputUserId
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
                    getListWarehouseAccount(context);
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

  Future<void> postDeleteAkunGudang(
      {required BuildContext context, required String inputUserId}) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postDeleteAkunGudang, data: {
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
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Navigator.pop(context);
                    getListWarehouseAccount(context);
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

  ModelWarehoseAccount? get modelWarehoseAccount => _modelWarehoseAccount;

  set modelWarehoseAccount(ModelWarehoseAccount? value) {
    _modelWarehoseAccount = value;
    notifyListeners();
  }

  bool? get userStatus => _userStatus;

  set userStatus(bool? value) {
    _userStatus = value;
    notifyListeners();
  }

  ModelDataEditWarehouse? get modelDataEditWarehouse => _modelDataEditWarehouse;

  set modelDataEditWarehouse(ModelDataEditWarehouse? value) {
    _modelDataEditWarehouse = value;
    notifyListeners();
  }

  String? get roleId => _roleId;

  set roleId(String? value) {
    _roleId = value;
    notifyListeners();
  }

  ModelListAddGudang? get modelListAddGudang => _modelListAddGudang;

  set modelListAddGudang(ModelListAddGudang? value) {
    _modelListAddGudang = value;
    notifyListeners();
  }

  String? get tanggalLahir => _tanggalLahir;

  set tanggalLahir(String? value) {
    _tanggalLahir = value;
    notifyListeners();
  }

  TextEditingController get tglLahirController => _tglLahirController;

  set tglLahirController(TextEditingController value) {
    _tglLahirController = value;
    notifyListeners();
  }

  TextEditingController get noNpwpController => _noNpwpController;

  set noNpwpController(TextEditingController value) {
    _noNpwpController = value;
    notifyListeners();
  }

  TextEditingController get noNikController => _noNikController;

  set noNikController(TextEditingController value) {
    _noNikController = value;
    notifyListeners();
  }

  TextEditingController get noHPController => _noHPController;

  set noHPController(TextEditingController value) {
    _noHPController = value;
    notifyListeners();
  }

  TextEditingController get alamatLengkapController => _alamatLengkapController;

  set alamatLengkapController(TextEditingController value) {
    _alamatLengkapController = value;
    notifyListeners();
  }

  TextEditingController get emailController => _emailController;

  set emailController(TextEditingController value) {
    _emailController = value;
    notifyListeners();
  }

  TextEditingController get namaController => _namaController;

  set namaController(TextEditingController value) {
    _namaController = value;
    notifyListeners();
  }

  TextEditingController get passwordController => _passwordController;

  set passwordController(TextEditingController value) {
    _passwordController = value;
    notifyListeners();
  }

  TextEditingController get usernameController => _usernameController;

  set usernameController(TextEditingController value) {
    _usernameController = value;
    notifyListeners();
  }
}
