import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/models/admin/transaction/stock_opname/model_add_step1.dart';
import 'package:pointofsales/models/admin/transaction/stock_opname/model_add_step2.dart';
import 'package:pointofsales/models/admin/transaction/stock_opname/model_detail_s_o.dart';
import 'package:pointofsales/models/admin/transaction/stock_opname/model_list_s_o.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/network/base_dio.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProviderStockOpname extends ChangeNotifier with BaseDio {
  ModelListSO? _modelListSO;
  ModelAddStep1? _modelAddStep1;
  ModelAddStep2? _modelAddStep2;
  ModelDetailSO? _modelDetailSO;
  String? dateNow;
  List<dynamic> _listItems = [];

  Future<void> getDate(DateRangePickerSelectionChangedArgs args) async {
    dateNow = DateFormat('yyyy-MM-dd').format(args.value).toString();
  }

  Future<void> updateStock(
      {required int i,
      bool isMinus = false,
      bool isDialog = false,
      int? quantity}) async {
    if (isMinus) {
      if (modelAddStep2!.data!.arrayProduk![i].stok! > 0) {
        modelAddStep2!.data!.arrayProduk![i].stok =
            modelAddStep2!.data!.arrayProduk![i].stok! - 1;
      }
      notifyListeners();
    } else {
      if (isDialog) {
        modelAddStep2!.data!.arrayProduk![i].stok = quantity;
      } else {
        modelAddStep2!.data!.arrayProduk![i].stok =
            modelAddStep2!.data!.arrayProduk![i].stok! + 1;
      }

      notifyListeners();
    }
  }

  Future<void> getListTransaction(BuildContext context) async {
    try {
      response = await dio.get(BaseUrl.getListTransaksiSO, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId()
      });
      modelListSO = ModelListSO.fromJson(response!.data);
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

  Future<void> getGudangSO({required BuildContext context}) async {
    try {
      response = await dio.get(BaseUrl.getGudangSO, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
      });
      modelAddStep1 = ModelAddStep1.fromJson(response!.data);
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

  Future<void> getProductSO(
      {required BuildContext context, required String inputRoleId}) async {
    try {
      response = await dio.get(BaseUrl.getProdukSO, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "input_role_id": inputRoleId,
      });
      modelAddStep2 = ModelAddStep2.fromJson(response!.data);
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

  Future<void> getDetailSO(
      {required BuildContext context, required String opnameId}) async {
    try {
      response = await dio.get(BaseUrl.getDetailSO, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "opname_id": opnameId,
      });
      modelDetailSO = ModelDetailSO.fromJson(response!.data);
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

  Future<void> postSubmitSO({
    required BuildContext context,
    // required String date,
    required String inputRoleId,
    required String keterangan,
    required String itemsOpname,
  }) async {
    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    response = await dio.post(BaseUrl.postSubmitSO, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "input_role_id": inputRoleId,
      "keterangan": keterangan,
      "itemsopname": itemsOpname,
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
                getListTransaction(context);
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

  ModelListSO? get modelListSO => _modelListSO;

  set modelListSO(ModelListSO? value) {
    _modelListSO = value;
    notifyListeners();
  }

  ModelAddStep1? get modelAddStep1 => _modelAddStep1;

  set modelAddStep1(ModelAddStep1? value) {
    _modelAddStep1 = value;
    notifyListeners();
  }

  ModelAddStep2? get modelAddStep2 => _modelAddStep2;

  set modelAddStep2(ModelAddStep2? value) {
    _modelAddStep2 = value;
    notifyListeners();
  }

  ModelDetailSO? get modelDetailSO => _modelDetailSO;

  set modelDetailSO(ModelDetailSO? value) {
    _modelDetailSO = value;
    notifyListeners();
  }

  List<dynamic> get listItems => _listItems;

  set listItems(List<dynamic> value) {
    _listItems = value;
    notifyListeners();
  }
}
