import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pointofsales/models/admin/warehouse/warehouse_master/model_list_master_gudang.dart';
import 'package:pointofsales/models/admin/warehouse/warehouse_master/model_master_edit_gudang.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/dialog_loading.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/network/base_dio.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';

class ProviderWarehouse extends ChangeNotifier with BaseDio {
  ModelListMasterGudang? _modelListMasterGudang;
  ModelMasterEditGudang? _modelMasterEditGudang;
  bool _activeSt = false;
  TextEditingController _namaGudangCont = TextEditingController();
  TextEditingController _descCont = TextEditingController();

  Future<void> getListMasterGudang({required BuildContext context}) async {
    try {
      response = await dio.get(BaseUrl.getListMasterGudang, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
      });
      modelListMasterGudang = ModelListMasterGudang.fromJson(response!.data);
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

  Future<void> postAddWarehouse({
    required BuildContext context,
    required String warehouseName,
    required String desc,
  }) async {
    loadingBuilder(title: 'Please wait...');

    response = await dio.post(BaseUrl.postAddMasterGudang, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "nama_gudang": warehouseName,
      "keterangan": desc,
    });

    try {
      if (response!.data['notif_st'] == true) {
        Get.back();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Get.back();
                    getListMasterGudang(context: context);
                  },
                  descriptions: response!.data['notif_msg'],
                ));
      } else {
        Get.back();
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

  Future<void> postEditWarehouse({
    required BuildContext context,
    required String inputRoleId,
    required String warehouseName,
    required String desc,
    required String aktifSt,
  }) async {
    loadingBuilder(title: 'Please wait...');

    response = await dio.post(BaseUrl.getEditMasterGudang, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "input_role_id": inputRoleId,
      "nama_gudang": warehouseName,
      "keterangan": desc,
      "aktif_st": aktifSt,
    });

    try {
      if (response!.data['notif_st'] == true) {
        Get.back();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Get.back();
                    getListMasterGudang(context: context);
                  },
                  descriptions: response!.data['notif_msg'],
                ));
      } else {
        Get.back();
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

  Future<void> postDeleteWarehouse(
      {required BuildContext context, required String inputRoleId}) async {
    loadingBuilder(title: 'Please wait...');

    response = await dio.post(BaseUrl.postDeleteMasterGudang, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "input_role_id": inputRoleId,
    });

    try {
      if (response!.data['notif_st'] == true) {
        Get.back();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Get.back();
                    getListMasterGudang(context: context);
                  },
                  descriptions: response!.data['notif_msg'],
                ));
      } else {
        Get.back();
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

  ModelListMasterGudang? get modelListMasterGudang => _modelListMasterGudang;

  set modelListMasterGudang(ModelListMasterGudang? value) {
    _modelListMasterGudang = value;
    notifyListeners();
  }

  ModelMasterEditGudang? get modelMasterEditGudang => _modelMasterEditGudang;

  set modelMasterEditGudang(ModelMasterEditGudang? value) {
    _modelMasterEditGudang = value;
    notifyListeners();
  }

  bool get activeSt => _activeSt;

  set activeSt(bool value) {
    _activeSt = value;
    notifyListeners();
  }

  TextEditingController get descCont => _descCont;

  set descCont(TextEditingController value) {
    _descCont = value;
    notifyListeners();
  }

  TextEditingController get namaGudangCont => _namaGudangCont;

  set namaGudangCont(TextEditingController value) {
    _namaGudangCont = value;
    notifyListeners();
  }
}
