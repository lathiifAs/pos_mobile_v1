import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/models/waiters/model_index_waiters.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_loading.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/network/base_dio.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';
import 'package:pointofsales/views/waiters/index_screen.dart';
import 'package:pointofsales/views/waiters/waiters_screen.dart';

class ProviderWaiters extends ChangeNotifier with BaseDio {
  ModelIndexWaiters? _modelIndexWaiters;
  bool? _isCartClick = false;
  bool? _isCartNull = false;
  bool _isAllClick = true;
  String mejaId = "";
  String? tableName;
  TextEditingController numberOfPersonCont = TextEditingController();
  TextEditingController customerNameCont = TextEditingController();

  String? _qtyItems;
  int? _totalHargaProduk;
  int _totalHargaManual = 0;
  String? _typeService;
  List<FormCart> _formCart = [];
  List<dynamic> _listDataCart = [];
  List<dynamic> _listManualProduct = [];

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
  }

  void getTotalHargaProduk() {
    totalHargaProduk = 0;
    listDataCart.forEach((element) {
      totalHargaProduk = totalHargaProduk! +
          int.parse(element["total_harga"].toString()) +
          totalHargaManual;
      notifyListeners();
    });
  }

  void addManualProduct(
      {required String productName,
      required int quantity,
      required int price,
      required int totalPrice,
      required String catatan}) {
    listManualProduct.add({
      'nama_item': productName,
      'qty': quantity,
      'harga': price,
      'total_harga': totalPrice,
      'catatan': catatan
    });

    notifyListeners();
  }

  void getTotalHargaManualProduct() {
    totalHargaManual = 0;
    listManualProduct.forEach((element) {
      totalHargaManual =
          totalHargaManual + int.parse(element["total_harga"].toString());
      notifyListeners();
    });
  }

  void deleteManualProduct(int i) {
    listManualProduct.removeAt(i);
    getTotalHargaProduk();
    getTotalHargaManualProduct();
    notifyListeners();
  }

  Future<void> deleteCart(int i) async {
    listDataCart.removeAt(i);
  }

  Future<void> getActiveColor(int i) async {
    modelIndexWaiters!.data!.arraySalesGroup!.forEach((element) {
      if (element.salesGroupId ==
          modelIndexWaiters!.data!.arraySalesGroup![i].salesGroupId) {
        element.activeColor = !element.activeColor!;
      } else {
        element.activeColor = false;
      }
    });
    notifyListeners();
  }

  Future<void> getIndexWaiters(BuildContext context) async {
    try {
      response = await dio.get(BaseUrl.getIndexCafe, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId()
      });
      modelIndexWaiters = ModelIndexWaiters.fromJson(response!.data);
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

  Future<void> getCategoryWaiters(
      {required BuildContext context,
      required int i,
      String? salesGroupId}) async {
    try {
      response = await dio.get(BaseUrl.getIndexCafe, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "sales_group_id": salesGroupId
      });
      modelIndexWaiters = ModelIndexWaiters.fromJson(response!.data);

      modelIndexWaiters!.data!.arraySalesGroup!.forEach((element) {
        if (element.salesGroupId ==
            modelIndexWaiters!.data!.arraySalesGroup![i].salesGroupId) {
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
    try {
      response = await dio.get(BaseUrl.getIndexCafe, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "search_produk": produkNama,
      });
      modelIndexWaiters = ModelIndexWaiters.fromJson(response!.data);
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

  Future<void> postSubmit(
      {required BuildContext context,
      String? idMeja,
      String? namaPemesan,
      String? typeServices,
      String? person,
      String? items,
      String? total,
      String? itemManualProduct}) async {
    loadingBuilder(title: 'Please wait...');

    response = await dio.post(BaseUrl.postSubmitWaiters, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "meja_id": idMeja,
      "nama_pemesan": namaPemesan,
      "type_service": typeService,
      "person": person,
      "items": items,
      "total": total,
      "item_tambahan": itemManualProduct
    });

    try {
      if (response!.data['notif_st'] == true) {
        Get.back();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => CustomDialogSuccess(
                  onPressed: () {
                    listDataCart = [];
                    isCartNull = false;
                    isCartClick = false;
                    qtyItems = null;
                    totalHargaProduk = 0;
                    listManualProduct = [];
                    customerNameCont.clear();
                    mejaId = '';
                    numberOfPersonCont.clear();
                    Get.offAll(IndexScreen());
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

  ModelIndexWaiters? get modelIndexWaiters => _modelIndexWaiters;

  set modelIndexWaiters(ModelIndexWaiters? value) {
    _modelIndexWaiters = value;
    notifyListeners();
  }

  bool? get isCartClick => _isCartClick;

  set isCartClick(bool? value) {
    _isCartClick = value;
    notifyListeners();
  }

  bool? get isCartNull => _isCartNull;

  set isCartNull(bool? value) {
    _isCartNull = value;
    notifyListeners();
  }

  List<dynamic> get listDataCart => _listDataCart;

  set listDataCart(List<dynamic> value) {
    _listDataCart = value;
    notifyListeners();
  }

  int? get totalHargaProduk => _totalHargaProduk;

  set totalHargaProduk(int? value) {
    _totalHargaProduk = value;
    notifyListeners();
  }

  String? get qtyItems => _qtyItems;

  set qtyItems(String? value) {
    _qtyItems = value;
    notifyListeners();
  }

  List<FormCart> get formCart => _formCart;

  set formCart(List<FormCart> value) {
    _formCart = value;
    notifyListeners();
  }

  String? get typeService => _typeService;

  set typeService(String? value) {
    _typeService = value;
    notifyListeners();
  }

  bool get isAllClick => _isAllClick;

  set isAllClick(bool value) {
    _isAllClick = value;
    notifyListeners();
  }

  List<dynamic> get listManualProduct => _listManualProduct;

  set listManualProduct(List<dynamic> value) {
    _listManualProduct = value;
    notifyListeners();
  }

  int get totalHargaManual => _totalHargaManual;

  set totalHargaManual(int value) {
    _totalHargaManual = value;
    notifyListeners();
  }
}

class FormCart {
  final TextEditingController controllerNotes;
  final TextEditingController controllerQty;

  FormCart({required this.controllerNotes, required this.controllerQty});
}
