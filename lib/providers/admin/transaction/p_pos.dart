import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/models/admin/transaction/pos/cafe/model_detail_order.dart';
import 'package:pointofsales/models/admin/transaction/pos/cafe/model_index_cafe.dart';
import 'package:pointofsales/models/admin/transaction/pos/cafe/model_list_transaction.dart';
import 'package:pointofsales/models/admin/transaction/pos/model_index.dart';
import 'package:pointofsales/providers/admin/p_printer.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';
import 'package:provider/provider.dart';

class ProviderPos with ChangeNotifier {
  late Response _response;
  BaseOptions options = new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  ModelIndex? _modelIndex;
  ModelIndexCafe? _modelIndexCafe;
  ModelListTransaction? _modelListTransaction;
  ModelDetailOrder? _modelDetailOrder;
  bool? _isCartNull = false;
  bool? _isCartClick = false;
  bool _isAllClick = true;
  String? _qtyItems;
  int? _totalHargaProduk;
  String? _paymentName;
  DateTime? _dateCheckout;
  double totalDiscount = 0;
  double discount = 0;
  double totalPPN = 0;
  double totalServices = 0;
  bool isPercent = false;
  int sumSubtotal = 0;
  int ppnValue = 0;
  int servicesValue = 0;
  TextEditingController controllerCash = TextEditingController();
  TextEditingController controllerChange = TextEditingController();
  List<dynamic> _listDataCart = [];

  Future<void> saveDiscountRetail() async {
    totalDiscount = 0;
    if (isPercent) {
      totalDiscount = (await getDiscount(
          cash: totalHargaProduk, percent: discount.toInt()))!;
      notifyListeners();
    } else {
      totalDiscount = discount;
      notifyListeners();
    }

    ppnServicesRetail();
  }

  Future<void> saveDiscountCafe(int total) async {
    totalDiscount = 0;
    if (isPercent) {
      totalDiscount = (await getDiscount(
          cash: modelDetailOrder!.data!.dataPemesan![0].total,
          percent: discount.toInt()))!;
      notifyListeners();
    } else {
      totalDiscount = discount;
      notifyListeners();
    }

    ppnServicesCafe(total: total);

    // var ppnValue =
    //     int.tryParse(modelIndex!.data!.arrayPrefrences![0].prefValue!);
    // var servicesValue =
    //     int.tryParse(modelIndex!.data!.arrayPrefrences![1].prefValue!);
  }

  void ppnServicesRetail() {
    totalPPN = ((totalHargaProduk! - totalDiscount) * ppnValue) / 100;
    totalServices = ((totalHargaProduk! - totalDiscount) * servicesValue) / 100;
    notifyListeners();
  }

  void ppnServicesCafe({required int total}) {
    totalPPN = ((total - totalDiscount) * ppnValue) / 100;
    totalServices = ((total - totalDiscount) * servicesValue) / 100;
    notifyListeners();
  }

  //functiomn discount
  Future<double?> getDiscount({int? cash, int? percent}) async {
    return (cash! * percent!) / 100;
  }

  //function service
  Future<double> getServices({int? cash, int? percent}) async {
    return (cash! * percent!) / 100;
  }

  Future<void> addCart(
      {int? produkId,
      String? productName,
      int? quantity,
      int? productPrice,
      bool minus = false,
      bool onDialog = false,
      String catatan = ""}) async {
    bool isProdukAvailable = false;
    totalHargaProduk = 0;

    if (listDataCart.length != 0 || listDataCart != []) {
      for (var element in listDataCart) {
        if (element["produk_nama"].toString().toLowerCase() ==
            productName!.toLowerCase()) {
          element['catatan'] = catatan;
          isProdukAvailable = true;

          if (minus) {
            element["qty"] -= quantity;

            if (element["qty"] <= 0) {
              deleteCart(listDataCart.indexOf(element));
              notifyListeners();
              break;
            }

            element["total_harga"] = element["qty"] * element["harga"];
          } else {
            if (onDialog) {
              element['qty'] = quantity;
            } else {
              element["qty"] += quantity;
            }
            element["total_harga"] = element["qty"] * element["harga"];
          }

          notifyListeners();
        }
      }
      if (listDataCart == [] || listDataCart.length == 0) {
        isCartNull = false;
        notifyListeners();
      } else {
        getTotalHargaProduk();
      }
    }

    if (!isProdukAvailable && !minus) {
      listDataCart.add({
        'produk_id': produkId,
        'produk_nama': productName,
        'qty': quantity,
        'harga': productPrice,
        'total_harga': productPrice,
        'catatan': catatan
      });
      getTotalHargaProduk();

      notifyListeners();
    }

    saveDiscountRetail();
  }

  void getTotalHargaProduk() {
    totalHargaProduk = 0;
    listDataCart.forEach((element) {
      totalHargaProduk =
          totalHargaProduk! + int.parse(element["total_harga"].toString());
      notifyListeners();
    });
  }

  Future<void> deleteCart(int i) async {
    listDataCart.removeAt(i);
  }

  Future<void> getActiveColor(int i) async {
    modelIndex!.data!.arraySalesGroup!.forEach((element) {
      if (element.salesGroupId ==
          modelIndex!.data!.arraySalesGroup![i].salesGroupId) {
        element.activeColor = !element.activeColor!;
      } else {
        element.activeColor = false;
      }
    });
    notifyListeners();
  }

  Future<void> getSubtotal(int i) async {
    modelDetailOrder!.data!.listItem!.forEach((element) {
      sumSubtotal += modelDetailOrder!.data!.listItem![i].subTotalProduk!;
    });
    print(sumSubtotal);
  }

  Future<void> getListIndex({required BuildContext context}) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getRetailIndex, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId()
      });
      modelIndex = ModelIndex.fromJson(_response.data);
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

  Future<void> getDetailOrder(
      {required BuildContext context, required String transaksiId}) async {
    Dio _dio = Dio(options);

    if (modelDetailOrder != null) {
      modelDetailOrder = null;
    }

    try {
      _response = await _dio.get(BaseUrl.getDetailOrder, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "transaksi_id": transaksiId
      });
      modelDetailOrder = ModelDetailOrder.fromJson(_response.data);
      ppnServicesCafe(total: modelDetailOrder!.data!.dataPemesan![0].total!);
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

  Future<void> getListTransaction(BuildContext context) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getListTransaction, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId()
      });
      modelListTransaction = ModelListTransaction.fromJson(_response.data);
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

  Future<void> getPPNandServices(BuildContext context) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getIndexCafe, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId()
      });
      modelIndexCafe = ModelIndexCafe.fromJson(_response.data);
      ppnValue =
          int.parse(modelIndexCafe!.data!.arrayPrefrences![0].prefValue!);
      servicesValue =
          int.parse(modelIndexCafe!.data!.arrayPrefrences![1].prefValue!);
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

  Future<void> getCategory(
      {required BuildContext context,
      required int i,
      String? salesGroupId}) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getRetailIndex, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "sales_group_id": salesGroupId
      });
      modelIndex = ModelIndex.fromJson(_response.data);

      modelIndex!.data!.arraySalesGroup!.forEach((element) {
        if (element.salesGroupId ==
            modelIndex!.data!.arraySalesGroup![i].salesGroupId) {
          element.activeColor = !element.activeColor!;
        } else {
          element.activeColor = false;
        }
      });
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

  Future<void> getSearchProduct(
      {required BuildContext context, required String? produkNama}) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getRetailIndex, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "search_produk": produkNama,
      });
      modelIndex = ModelIndex.fromJson(_response.data);
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

  Future<void> postSubmitCashier(
      {required BuildContext context,
      required String paymentId,
      required String totalHarga,
      required String items,
      required String ppnValue,
      required String discountValue,
      required String servicesValue}) async {
    Dio _dio = Dio(options);
    // print(dateCheckout);
    // var printer=Provider.of<ProviderPrinter>(context,listen: false);
    // printer.checkConnectedPrinter();
    //
    // ProgressDialog pg = ProgressDialog(context,
    //     message: Text("Please wait.."),
    //     dismissable: false,
    //     blur: 3,
    //     dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
    //     title: null);
    // pg.show();

    _response = await _dio.post(BaseUrl.postSubmitRetail, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "payment_id": paymentId,
      "total_harga": totalHarga,
      "items": items,
      "ppn_nilai": ppnValue,
      "diskon_nilai": discountValue,
      "service_nilai": servicesValue,
    });

    try {
      if (_response.data['notif_st'] == true) {
        // pg.dismiss();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Navigator.pop(context);
                    getListIndex(context: context);
                    Navigator.pop(context);
                  },
                  descriptions: _response.data['notif_msg'],
                ));
        listDataCart = [];
        isCartNull = false;
        isCartClick = false;
      } else {
        // pg.dismiss();
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

  Future<void> postSubmitCashierCafe({
    required BuildContext context,
    required String paymentId,
    required String totalHarga,
    required String ppnValue,
    required String discountValue,
    required String servicesValue,
    required String transaksiId,
  }) async {
    Dio _dio = Dio(options);

    // ProgressDialog pg = ProgressDialog(context,
    //     message: Text("Please wait.."),
    //     dismissable: false,
    //     blur: 3,
    //     dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
    //     title: null);
    // pg.show();

    _response = await _dio.post(BaseUrl.postSubmitCashierCafe, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "payment_id": paymentId,
      "total_harga": totalHarga,
      "ppn_nilai": ppnValue,
      "diskon_nilai": discountValue,
      "service_nilai": servicesValue,
      "transaksi_id": transaksiId,
    });

    try {
      if (_response.data['notif_st'] == true) {
        // pg.dismiss();

        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    Navigator.pop(context);
                    getListTransaction(context);
                    listDataCart = [];
                    isCartNull = false;
                    isCartClick = false;
                    Navigator.pop(context);
                  },
                  descriptions: _response.data['notif_msg'],
                ));
        // printer.checkConnectedPrinter();
      } else {
        // pg.dismiss();
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

  ModelIndex? get modelIndex => _modelIndex;

  set modelIndex(ModelIndex? value) {
    _modelIndex = value;
    notifyListeners();
  }

  ModelListTransaction? get modelListTransaction => _modelListTransaction;

  set modelListTransaction(ModelListTransaction? value) {
    _modelListTransaction = value;
    notifyListeners();
  }

  ModelIndexCafe? get modelIndexCafe => _modelIndexCafe;

  set modelIndexCafe(ModelIndexCafe? value) {
    _modelIndexCafe = value;
    notifyListeners();
  }

  ModelDetailOrder? get modelDetailOrder => _modelDetailOrder;

  set modelDetailOrder(ModelDetailOrder? value) {
    _modelDetailOrder = value;
    notifyListeners();
  }

  List<dynamic> get listDataCart => _listDataCart;

  set listDataCart(List<dynamic> value) {
    _listDataCart = value;
    notifyListeners();
  }

  bool? get isCartNull => _isCartNull;

  set isCartNull(bool? value) {
    _isCartNull = value;
    notifyListeners();
  }

  bool? get isCartClick => _isCartClick;

  set isCartClick(bool? value) {
    _isCartClick = value;
    notifyListeners();
  }

  String? get qtyItems => _qtyItems;

  set qtyItems(String? value) {
    _qtyItems = value;
    notifyListeners();
  }

  int? get totalHargaProduk => _totalHargaProduk;

  set totalHargaProduk(int? value) {
    _totalHargaProduk = value;
    notifyListeners();
  }

  String? get paymentName => _paymentName;

  set paymentName(String? value) {
    _paymentName = value;
    notifyListeners();
  }

  bool get isAllClick => _isAllClick;

  set isAllClick(bool value) {
    _isAllClick = value;
    notifyListeners();
  }

  DateTime? get dateCheckout => _dateCheckout;

  set dateCheckout(DateTime? value) {
    _dateCheckout = value;
    notifyListeners();
  }
}

class DataCart {
  String? produkNama;
  String? quantity;
  String? harga;

  DataCart(this.produkNama, this.quantity, this.harga);
}
