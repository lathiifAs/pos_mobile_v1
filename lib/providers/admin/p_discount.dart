import 'dart:convert';
import 'dart:io' as Io;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/models/ADMIN/discount/model_data_add.dart';
import 'package:pointofsales/models/ADMIN/discount/model_data_edit.dart';
import 'package:pointofsales/models/ADMIN/discount/model_data_group.dart';
import 'package:pointofsales/models/ADMIN/discount/model_list_discount.dart';
import 'package:pointofsales/models/admin/discount/model_list_discount_get.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProviderDiscount with ChangeNotifier {
  late Response _response;
  BaseOptions options = new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  ModelListDiscount? _modelListDiscount;
  ModelDataAdd? _modelDataAdd;
  ModelDataGroup? _modelDataGroup;
  ModelDataEdit? _modelDataEdit;
  ModelListDiscountGet? _modelListDiscountGet;

  String? _groupId;
  String? _salesGroupId;
  String? _produkId;
  String? _startDate;
  String? _endDate;
  Io.File? _fileImgDiscount;
  String? _imgDiscount;

  Future<void> getStartDate(DateRangePickerSelectionChangedArgs args) async {
    startDate = DateFormat('yyyy-MM-dd').format(args.value).toString();
  }

  Future<void> getEndDate(DateRangePickerSelectionChangedArgs args) async {
    endDate = DateFormat('yyyy-MM-dd').format(args.value).toString();
  }

  Future getImageDiscount() async {
    final ImagePicker _picker = ImagePicker();
    var file = await _picker.pickImage(source: ImageSource.gallery);
    var result = await FlutterImageCompress.compressAndGetFile(
        file!.path, file.path + ".jpg",
        quality: 10);
    fileImgDiscount = Io.File(file.path);
    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String encoded = stringToBase64.encode(result!.path);
    final bytes = Io.File(result!.path).readAsBytesSync();
    String img64 = base64.encode(bytes);
    imgDiscount = "data:image/jpg;base64,$img64";
  }

  Future<void> getListDiscount(BuildContext context) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getListDiscount, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId()
      });
      modelListDiscount = ModelListDiscount.fromJson(_response.data);
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

  Future<void> getListDiscountGet(BuildContext context) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getListDiscountGet, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId()
      });
      modelListDiscountGet = ModelListDiscountGet.fromJson(_response.data);
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

  Future<void> getAddDiscount(BuildContext context) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.postAddDiscount, queryParameters: {
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

  // Future<void> getDataGroup(BuildContext context, String groupId) async {
  //   Dio _dio = Dio(options);
  //
  //   try {
  //     _response = await _dio.get(BaseUrl.getDataGroup, queryParameters: {
  //       "user_id": await getUserId(),
  //       "token": await getToken(),
  //       "token_key": await getTokenKey(),
  //       "role_id": await getRoleId(),
  //       "group_id": groupId
  //     });
  //     modelDataGroup = ModelDataGroup.fromJson(_response.data);
  //   } on DioError catch (e) {
  //     if (e.type == DioErrorType.connectTimeout) {
  //       ScaffoldMessenger.of(context).showSnackBar(snackbarConnectTimeout);
  //     } else if (e.type == DioErrorType.receiveTimeout) {
  //       ScaffoldMessenger.of(context).showSnackBar(snackbarReceiveTimeout);
  //     } else if (e.type == DioErrorType.sendTimeout) {
  //       ScaffoldMessenger.of(context).showSnackBar(snackbarSendTimout);
  //     } else if (e.type == DioErrorType.other) {
  //       ScaffoldMessenger.of(context).showSnackBar(snackbarOther);
  //     }
  //   }
  // }

  Future<void> getDataEdit(BuildContext context, String discountId) async {
    Dio _dio = Dio(options);

    modelDataEdit = null;

    try {
      _response = await _dio.get(BaseUrl.postEditDiscount, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "diskon_id": discountId
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

  Future<void> postAddDiscount(
    BuildContext context,
    String groupId,
    String discountName,
    String discountDesc,
    String salesGroupId,
    String produkId,
    String minPurchase,
    String startDate,
    String endDate,
    String startTime,
    String endTime,
    String percent,
    String imageDiscount,
  ) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postAddDiscount, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "group_id": groupId,
      "diskon_nama": discountName,
      "diskon_desc": discountDesc,
      "sales_group_id": salesGroupId,
      "produk_id": produkId,
      "diskon_syarat_jml_pembelian": minPurchase,
      "diskon_tgl_mulai": startDate,
      "diskon_tgl_exp": endDate,
      "diskon_jam_mulai": startTime,
      "diskon_jam_exp": endTime,
      "diskon_presentase": percent,
      "gambar_diskon": imageDiscount,
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
                    getListDiscount(context);
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

  Future<void> postAddDiscountGet(
    BuildContext context,
    String groupId,
    String discountName,
    String discountDesc,
    String syaratSalesGroupId,
    String syaratProdukId,
    String qtySyarat,
    String minPurchase,
    String startDate,
    String endDate,
    String startTime,
    String endTime,
    String percent,
    String imageDiscount,
    String freeSalesGroupId,
    String freeProdukId,
  ) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postAddDiscount, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "group_id": groupId,
      "diskon_nama": discountName,
      "diskon_desc": discountDesc,
      "syarat_sales_group_id": syaratSalesGroupId,
      "syarat_produk_id": syaratProdukId,
      "qty_syarat": qtySyarat,
      "diskon_syarat_jml_pembelian": minPurchase,
      "diskon_tgl_mulai": startDate,
      "diskon_tgl_exp": endDate,
      "diskon_jam_mulai": startTime,
      "diskon_jam_exp": endTime,
      "diskon_presentase": percent,
      "gambar_diskon": imageDiscount,
      "free_sales_group_id": freeSalesGroupId,
      "free_produk_id": freeProdukId,
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
                    getListDiscountGet(context);
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

  Future<void> postDeleteDiscount(
      {required BuildContext context, required String discountId}) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postDeleteDiscount, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "diskon_id": discountId
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
                    getListDiscount(context);
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

  Future<void> postEditDiscount(
    BuildContext context,
    String groupId,
    String diskonNama,
    String diskonDesc,
    String salesGroupId,
    String produkId,
    String minPurchase,
    String diskonTglMulai,
    String diskonTglExp,
    String diskonJamMulai,
    String diskonJamExp,
    String diskonPresentase,
    String imageFileOldName,
    String gambarDiskon,
    String diskonId,
  ) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postEditDiscount, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "group_id": groupId,
      "diskon_nama": diskonNama,
      "diskon_desc": diskonDesc,
      "sales_group_id": salesGroupId,
      "produk_id": produkId,
      "diskon_syarat_jml_pembelian": minPurchase,
      "diskon_tgl_mulai": diskonTglMulai,
      "diskon_tgl_exp": diskonTglExp,
      "diskon_jam_mulai": diskonJamMulai,
      "diskon_jam_exp": diskonJamExp,
      "diskon_presentase": diskonPresentase,
      "diskon_file_old_name": imageFileOldName,
      "gambar_diskon": gambarDiskon,
      "diskon_id": diskonId,
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
                    getListDiscount(context);
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

  ModelDataGroup? get modelDataGroup => _modelDataGroup;

  set modelDataGroup(ModelDataGroup? value) {
    _modelDataGroup = value;
    notifyListeners();
  }

  ModelDataEdit? get modelDataEdit => _modelDataEdit;

  set modelDataEdit(ModelDataEdit? value) {
    _modelDataEdit = value;
    notifyListeners();
  }

  String? get startDate => _startDate;

  set startDate(String? value) {
    _startDate = value;
    notifyListeners();
  }

  Io.File? get fileImgDiscount => _fileImgDiscount;

  set fileImgDiscount(Io.File? value) {
    _fileImgDiscount = value;
    notifyListeners();
  }

  String? get imgDiscount => _imgDiscount;

  set imgDiscount(String? value) {
    _imgDiscount = value;
    notifyListeners();
  }

  String? get endDate => _endDate;

  set endDate(String? value) {
    _endDate = value;
    notifyListeners();
  }

  String? get produkId => _produkId;

  set produkId(String? value) {
    _produkId = value;
    notifyListeners();
  }

  String? get salesGroupId => _salesGroupId;

  set salesGroupId(String? value) {
    _salesGroupId = value;
    notifyListeners();
  }

  String? get groupId => _groupId;

  set groupId(String? value) {
    _groupId = value;
    notifyListeners();
  }

  ModelDataAdd? get modelDataAdd => _modelDataAdd;

  set modelDataAdd(ModelDataAdd? value) {
    _modelDataAdd = value;
    notifyListeners();
  }

  ModelListDiscount? get modelListDiscount => _modelListDiscount;

  set modelListDiscount(ModelListDiscount? value) {
    _modelListDiscount = value;
    notifyListeners();
  }

  ModelListDiscountGet? get modelListDiscountGet => _modelListDiscountGet;

  set modelListDiscountGet(ModelListDiscountGet? value) {
    _modelListDiscountGet = value;
    notifyListeners();
  }
}
