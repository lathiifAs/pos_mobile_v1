import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/models/admin/transaction/purchasing/model_data_add.dart';
import 'package:pointofsales/models/admin/transaction/purchasing/model_list_purchasing.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';

class ProviderPurchasing with ChangeNotifier {
  late Response _response;
  BaseOptions options = new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  ModelListPurchasing? _modelListPurchasing;
  ModelDataAdd? _modelDataAdd;
  bool _isCartClick = false;
  bool _isCartNull = false;
  String _qtyItems = '0';
  List<dynamic> _listProduct = [];

  Future<void> addCart(
      {int? produkId,
      String? productName,
      int? quantity,
      int? productPrice,
      bool minus = false,
      bool onDialog = false,
      String catatan = ""}) async {
    bool isProdukAvailable = false;

    if (listProduct.length != 0 || listProduct != []) {
      for (var element in listProduct) {
        if (element["produk_nama"].toString().toLowerCase() ==
            productName!.toLowerCase()) {
          element['catatan'] = catatan;
          isProdukAvailable = true;

          if (minus) {
            element["jumlah"] -= quantity;

            if (element["jumlah"] <= 0) {
              deleteCart(listProduct.indexOf(element));
              notifyListeners();
              break;
            }

            element["total"] = element["jumlah"] * element["harga"];
          } else {
            if (onDialog) {
              element['jumlah'] = quantity;
            } else {
              element["jumlah"] += quantity;
            }
            element["total"] = element["jumlah"] * element["harga"];
          }

          notifyListeners();
        }
      }
    }

    if (!isProdukAvailable && !minus) {
      listProduct.add({
        'produk_id': produkId,
        'produk_nama': productName,
        'jumlah': quantity,
        'harga': productPrice,
        'total': productPrice,
        'catatan': catatan
      });

      notifyListeners();
    }
  }

  Future<void> deleteCart(int i) async {
    listProduct.removeAt(i);
  }

  Future<void> getListPurchasing(BuildContext context) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getListPurchasing, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId()
      });
      modelListPurchasing = ModelListPurchasing.fromJson(_response.data);
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
          await _dio.get(BaseUrl.getDataAddPurchasing, queryParameters: {
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

  Future<void> postAddPurchasing({
    required BuildContext context,
    required String tglPembelian,
    required String noSupplier,
    required String warehouseId,
    required String supplierId,
    required String catatan,
    required String produkPurchasing,
  }) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postAddPurchasing, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "tgl_pembelian": tglPembelian,
      "no_supplier": noSupplier,
      "warehouse_id": warehouseId,
      "supplier_id": supplierId,
      "catatan": catatan,
      "produk_purchasing": produkPurchasing,
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
                    getListPurchasing(context);
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

  ModelDataAdd? get modelDataAdd => _modelDataAdd;

  set modelDataAdd(ModelDataAdd? value) {
    _modelDataAdd = value;
    notifyListeners();
  }

  ModelListPurchasing? get modelListPurchasing => _modelListPurchasing;

  set modelListPurchasing(ModelListPurchasing? value) {
    _modelListPurchasing = value;
    notifyListeners();
  }

  List<dynamic> get listProduct => _listProduct;

  set listProduct(List<dynamic> value) {
    _listProduct = value;
    notifyListeners();
  }

  String get qtyItems => _qtyItems;

  set qtyItems(String value) {
    _qtyItems = value;
    notifyListeners();
  }

  bool get isCartNull => _isCartNull;

  set isCartNull(bool value) {
    _isCartNull = value;
    notifyListeners();
  }

  bool get isCartClick => _isCartClick;

  set isCartClick(bool value) {
    _isCartClick = value;
    notifyListeners();
  }
}
