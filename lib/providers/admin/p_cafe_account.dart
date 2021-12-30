import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/models/ADMIN/cafe_account/model_cafe_account.dart';
import 'package:pointofsales/models/ADMIN/cafe_account/model_data_edit_akun_cafe.dart';
import 'package:pointofsales/models/admin/cafe_account/model_data_add.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class ProviderCafeAccount with ChangeNotifier {
  late Response _response;
  BaseOptions options = new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  ModelCafeAccount? _modelCafeAccount;
  ModelDataEditAkunCafe? _modelDataEditAkunCafe;
  ModelDataAdd? _modelDataAdd;
  bool _userStatus = false;
  String? _kitchenId = "";
  String? _tanggalLahir;
  String? _groupId = '';
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _alamatLengkapController = TextEditingController();
  TextEditingController _noHPController = TextEditingController();
  TextEditingController _noNikController = TextEditingController();
  TextEditingController _noNpwpController = TextEditingController();

  // TextEditingController _tglLahirController = TextEditingController();

  Future<void> getTanggalLahir(DateRangePickerSelectionChangedArgs args) async {
    tanggalLahir = DateFormat('yyyy-MM-dd').format(args.value).toString();
  }

  Future<void> getListCafeAccount(BuildContext context, String parentId) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getListCafeAccount, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "parent_id": parentId
      });
      modelCafeAccount = ModelCafeAccount.fromJson(_response.data);
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

  Future<void> getListRole(BuildContext context, String parentId) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getAddAkunByCafe, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "parent_id": parentId
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

  Future<void> getDataEditAkunCafe(
      BuildContext context, String inputUserId) async {
    Dio _dio = Dio(options);

    modelDataEditAkunCafe = null;

    try {
      _response = await _dio.get(BaseUrl.postEditAkunCafe, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "input_user_id": inputUserId
      });
      modelDataEditAkunCafe = ModelDataEditAkunCafe.fromJson(_response.data);
      userStatus =
          modelDataEditAkunCafe!.data!.result!.userSt == '1' ? true : false;
      usernameController.text = modelDataEditAkunCafe!.data!.result!.userName!;
      namaController.text = modelDataEditAkunCafe!.data!.result!.nama!;
      emailController.text = modelDataEditAkunCafe!.data!.result!.email!;
      noHPController.text = modelDataEditAkunCafe!.data!.result!.noHp!;
      alamatLengkapController.text =
          modelDataEditAkunCafe!.data!.result!.alamatLengkap!;
      // tglLahirController.text = modelDataEditAkunCafe!.data!.result!.tglLahir!;
      noNikController.text = modelDataEditAkunCafe!.data!.result!.noNik!;
      noNpwpController.text = modelDataEditAkunCafe!.data!.result!.noNpwp!;
      tanggalLahir = modelDataEditAkunCafe!.data!.result!.tglLahir!.substring(0, 10);
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

  Future<void> postAddCafeAccount({
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
    required String groupId,
    String? kitchenId,
    String? parentId,
  }) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.getAddAkunByCafe, data: {
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
      "kitchen_id": kitchenId,
      "group_id": groupId,
      "parent_id": parentId,
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
                    getListCafeAccount(context, parentId!);
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

  Future<void> postDeleteAkunCafe(
      {required BuildContext context,
      required String inputUserId,
      required String parentId}) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postDeleteAkunCafe, data: {
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
                    getListCafeAccount(context, parentId);
                    Navigator.pop(context);
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

  Future<void> postEditAkunCafe(
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

    _response = await _dio.post(BaseUrl.postEditAkunCafe, data: {
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
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Navigator.pop(context);
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

  bool get userStatus => _userStatus;

  set userStatus(bool value) {
    _userStatus = value;
    notifyListeners();
  }

  ModelDataEditAkunCafe? get modelDataEditAkunCafe => _modelDataEditAkunCafe;

  set modelDataEditAkunCafe(ModelDataEditAkunCafe? value) {
    _modelDataEditAkunCafe = value;
    notifyListeners();
  }

  String? get tanggalLahir => _tanggalLahir;

  set tanggalLahir(String? value) {
    _tanggalLahir = value;
    notifyListeners();
  }

  ModelDataAdd? get modelDataAdd => _modelDataAdd;

  set modelDataAdd(ModelDataAdd? value) {
    _modelDataAdd = value;
    notifyListeners();
  }

  ModelCafeAccount? get modelCafeAccount => _modelCafeAccount;

  set modelCafeAccount(ModelCafeAccount? value) {
    _modelCafeAccount = value;
    notifyListeners();
  }

  String? get kitchenId => _kitchenId;

  set kitchenId(String? value) {
    _kitchenId = value;
    notifyListeners();
  }

  String? get groupId => _groupId;

  set groupId(String? value) {
    _groupId = value;
    notifyListeners();
  }

  TextEditingController get noNpwpController => _noNpwpController;

  set noNpwpController(TextEditingController value) {
    _noNpwpController = value;
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

  // TextEditingController get tglLahirController => _tglLahirController;
  //
  // set tglLahirController(TextEditingController value) {
  //   _tglLahirController = value;
  //   notifyListeners();
  // }

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
}
