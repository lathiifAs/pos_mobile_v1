import 'dart:convert';
import 'dart:io' as Io;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/models/admin/product/model_data_add.dart';
import 'package:pointofsales/models/admin/product/model_detail_product.dart';
import 'package:pointofsales/models/admin/product/model_list_product_group.dart';
import 'package:pointofsales/models/admin/product/model_list_product.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';

class ProviderProduct with ChangeNotifier {
  late Response _response;
  BaseOptions options = new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  ModelListProductGroup? _modelListProductGroup;
  ModelListProduct? _modelListProduct;
  ModelDataAdd? _modelDataAdd;
  ModelDetailProduct? _modelDetailProduct;
  String? _subProductGroupId;
  bool _favStatus = false;

  List<FormRetail> _formRetail = [];
  List<dynamic> _listDataRetail = [];

  List<FormResep> _formResep = [];
  List<dynamic> _listDataFormResep = [];

  Io.File? _fileImgAddBahanBaku;
  String? _imgAddBahanBaku;

  Io.File? _fileImgCoverAddSiapJual;
  Io.File? _fileImgSiapJual1;
  Io.File? _fileImgSiapJual2;
  Io.File? _fileImgSiapJual3;
  Io.File? _fileImgSiapJual4;
  Io.File? _fileImgSiapJual5;

  Io.File? _fileImgCoverHasilProduksi;
  Io.File? _fileImgHasilProduksi1;
  Io.File? _fileImgHasilProduksi2;
  Io.File? _fileImgHasilProduksi3;
  Io.File? _fileImgHasilProduksi4;
  Io.File? _fileImgHasilProduksi5;

  String? _imgCoverAddSiapJual;
  String? _imgSiapJual1;
  String? _imgSiapJual2;
  String? _imgSiapJual3;
  String? _imgSiapJual4;
  String? _imgSiapJual5;

  String? _imgCoverHasilProduksi;
  String? _imgHasilProduksi1;
  String? _imgHasilProduksi2;
  String? _imgHasilProduksi3;
  String? _imgHasilProduksi4;
  String? _imgHasilProduksi5;

  Future<void> addForm() async {
    formRetail.add(FormRetail(selectedItem: null));
  }

  Future<void> deleteForm(int i) async {
    formRetail.removeAt(i);
  }

  Future<void> onSubmitted() async {
    formRetail.forEach((element) {
      if (element.selectedItem != null) {
        listDataRetail.add(int.parse(element.selectedItem!));
      }
    });

    // print(jsonEncode(listDataRetail));
  }

  Future<void> addFormResep() async {
    formResep.add(FormResep(
        selectedItemBahanBaku: null,
        qtyController: TextEditingController(),
        selectedItemUnit: null));
  }

  Future<void> deleteFormResep(int i) async {
    formResep.removeAt(i);
  }

  Future<void> onSubmittedFormResep() async {
    formResep.forEach((element) {
      if (element.selectedItemBahanBaku != null &&
          element.qtyController.text.isNotEmpty &&
          element.selectedItemUnit != null) {
        listDataFormResep.add({
          'bahan_baku_id': int.parse(element.selectedItemBahanBaku!),
          'jml_resep': int.parse(element.qtyController.text),
          'satuan_id': int.parse(element.selectedItemUnit!),
        });
      }
    });
  }

  Future getImageAddBahanBaku() async {
    final ImagePicker _picker = ImagePicker();
    var file = await _picker.pickImage(source: ImageSource.gallery);
    var result = await FlutterImageCompress.compressAndGetFile(
        file!.path, file.path + ".jpg",
        quality: 10);
    fileImgAddBahanBaku = Io.File(file.path);
    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String encoded = stringToBase64.encode(result!.path);
    final bytes = Io.File(result!.path).readAsBytesSync();
    String img64 = base64.encode(bytes);
    imgAddBahanBaku = "data:image/jpg;base64,$img64";
  }

  Future getImgCoverAddSiapJual() async {
    final ImagePicker _picker = ImagePicker();
    var file = await _picker.pickImage(source: ImageSource.gallery);
    var result = await FlutterImageCompress.compressAndGetFile(
        file!.path, file.path + ".jpg",
        quality: 10);
    fileImgCoverAddSiapJual = Io.File(file.path);
    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String encoded = stringToBase64.encode(result!.path);
    final bytes = Io.File(result!.path).readAsBytesSync();
    String img64 = base64.encode(bytes);
    imgCoverAddSiapJual = "data:image/jpg;base64,$img64";
  }

  Future getImgSiapJual1() async {
    final ImagePicker _picker = ImagePicker();
    var file = await _picker.pickImage(source: ImageSource.gallery);
    var result = await FlutterImageCompress.compressAndGetFile(
        file!.path, file.path + ".jpg",
        quality: 10);
    fileImgSiapJual1 = Io.File(file.path);
    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String encoded = stringToBase64.encode(result!.path);
    final bytes = Io.File(result!.path).readAsBytesSync();
    String img64 = base64.encode(bytes);
    imgSiapJual1 = "data:image/jpg;base64,$img64";
  }

  Future getImgSiapJual2() async {
    final ImagePicker _picker = ImagePicker();
    var file = await _picker.pickImage(source: ImageSource.gallery);
    var result = await FlutterImageCompress.compressAndGetFile(
        file!.path, file.path + ".jpg",
        quality: 10);
    fileImgSiapJual2 = Io.File(file.path);
    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String encoded = stringToBase64.encode(result!.path);
    final bytes = Io.File(result!.path).readAsBytesSync();
    String img64 = base64.encode(bytes);
    imgSiapJual2 = "data:image/jpg;base64,$img64";
  }

  Future getImgSiapJual3() async {
    final ImagePicker _picker = ImagePicker();
    var file = await _picker.pickImage(source: ImageSource.gallery);
    var result = await FlutterImageCompress.compressAndGetFile(
        file!.path, file.path + ".jpg",
        quality: 10);
    fileImgSiapJual3 = Io.File(file.path);
    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String encoded = stringToBase64.encode(result!.path);
    final bytes = Io.File(result!.path).readAsBytesSync();
    String img64 = base64.encode(bytes);
    imgSiapJual3 = "data:image/jpg;base64,$img64";
  }

  Future getImgSiapJual4() async {
    final ImagePicker _picker = ImagePicker();
    var file = await _picker.pickImage(source: ImageSource.gallery);
    var result = await FlutterImageCompress.compressAndGetFile(
        file!.path, file.path + ".jpg",
        quality: 10);
    fileImgSiapJual4 = Io.File(file.path);
    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String encoded = stringToBase64.encode(result!.path);
    final bytes = Io.File(result!.path).readAsBytesSync();
    String img64 = base64.encode(bytes);
    imgSiapJual4 = "data:image/jpg;base64,$img64";
  }

  Future getImgSiapJual5() async {
    final ImagePicker _picker = ImagePicker();
    var file = await _picker.pickImage(source: ImageSource.gallery);
    var result = await FlutterImageCompress.compressAndGetFile(
        file!.path, file.path + ".jpg",
        quality: 10);
    fileImgSiapJual5 = Io.File(file.path);
    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String encoded = stringToBase64.encode(result!.path);
    final bytes = Io.File(result!.path).readAsBytesSync();
    String img64 = base64.encode(bytes);
    imgSiapJual5 = "data:image/jpg;base64,$img64";
  }

  Future getImgCoverHasilProduksi() async {
    final ImagePicker _picker = ImagePicker();
    var file = await _picker.pickImage(source: ImageSource.gallery);
    var result = await FlutterImageCompress.compressAndGetFile(
        file!.path, file.path + ".jpg",
        quality: 10);
    fileImgCoverHasilProduksi = Io.File(file.path);
    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String encoded = stringToBase64.encode(result!.path);
    final bytes = Io.File(result!.path).readAsBytesSync();
    String img64 = base64.encode(bytes);
    imgCoverHasilProduksi = "data:image/jpg;base64,$img64";
  }

  Future getImgHasilProduksi1() async {
    final ImagePicker _picker = ImagePicker();
    var file = await _picker.pickImage(source: ImageSource.gallery);
    var result = await FlutterImageCompress.compressAndGetFile(
        file!.path, file.path + ".jpg",
        quality: 10);
    fileImgHasilProduksi1 = Io.File(file.path);
    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String encoded = stringToBase64.encode(result!.path);
    final bytes = Io.File(result!.path).readAsBytesSync();
    String img64 = base64.encode(bytes);
    imgHasilProduksi1 = "data:image/jpg;base64,$img64";
  }

  Future getImgHasilProduksi2() async {
    final ImagePicker _picker = ImagePicker();
    var file = await _picker.pickImage(source: ImageSource.gallery);
    var result = await FlutterImageCompress.compressAndGetFile(
        file!.path, file.path + ".jpg",
        quality: 10);
    fileImgHasilProduksi2 = Io.File(file.path);
    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String encoded = stringToBase64.encode(result!.path);
    final bytes = Io.File(result!.path).readAsBytesSync();
    String img64 = base64.encode(bytes);
    imgHasilProduksi2 = "data:image/jpg;base64,$img64";
  }

  Future getImgHasilProduksi3() async {
    final ImagePicker _picker = ImagePicker();
    var file = await _picker.pickImage(source: ImageSource.gallery);
    var result = await FlutterImageCompress.compressAndGetFile(
        file!.path, file.path + ".jpg",
        quality: 10);
    fileImgHasilProduksi3 = Io.File(file.path);
    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String encoded = stringToBase64.encode(result!.path);
    final bytes = Io.File(result!.path).readAsBytesSync();
    String img64 = base64.encode(bytes);
    imgHasilProduksi3 = "data:image/jpg;base64,$img64";
  }

  Future getImgHasilProduksi4() async {
    final ImagePicker _picker = ImagePicker();
    var file = await _picker.pickImage(source: ImageSource.gallery);
    var result = await FlutterImageCompress.compressAndGetFile(
        file!.path, file.path + ".jpg",
        quality: 10);
    fileImgHasilProduksi4 = Io.File(file.path);
    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String encoded = stringToBase64.encode(result!.path);
    final bytes = Io.File(result!.path).readAsBytesSync();
    String img64 = base64.encode(bytes);
    imgHasilProduksi4 = "data:image/jpg;base64,$img64";
  }

  Future getImgHasilProduksi5() async {
    final ImagePicker _picker = ImagePicker();
    var file = await _picker.pickImage(source: ImageSource.gallery);
    var result = await FlutterImageCompress.compressAndGetFile(
        file!.path, file.path + ".jpg",
        quality: 10);
    fileImgHasilProduksi5 = Io.File(file.path);
    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String encoded = stringToBase64.encode(result!.path);
    final bytes = Io.File(result!.path).readAsBytesSync();
    String img64 = base64.encode(bytes);
    imgHasilProduksi5 = "data:image/jpg;base64,$img64";
  }

  Future<void> getListProductGroup(BuildContext context) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getProductGroup, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId()
      });
      modelListProductGroup = ModelListProductGroup.fromJson(_response.data);
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

  Future<void> getListProduct(
      BuildContext context, String productGroupId) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getListProduct, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "produk_group_id": productGroupId
      });
      modelListProduct = ModelListProduct.fromJson(_response.data);
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

  Future<void> getDataAdd(BuildContext context, String productGroupId) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.postAddProduct, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "produk_group_id": productGroupId
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

  Future<void> getDetailProduct(
      {required BuildContext context, required String productId}) async {
    Dio _dio = Dio(options);

    try {
      _response = await _dio.get(BaseUrl.getDetailProduct, queryParameters: {
        "user_id": await getUserId(),
        "token": await getToken(),
        "token_key": await getTokenKey(),
        "role_id": await getRoleId(),
        "produk_id": productId,
      });
      modelDetailProduct = ModelDetailProduct.fromJson(_response.data);
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

  Future<void> postAddBahanBaku(
    BuildContext context,
    String produkGroupId,
    String produkNama,
    String subProdukGroupId,
    String produkCoverImg,
    String produkHarga,
    String satuanDasarId,
    String minStock,
    String maxStock,
    String alias,
  ) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postAddProduct, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "produk_group_id": produkGroupId,
      "produk_nama": produkNama,
      "sub_produk_group_id": subProdukGroupId,
      "produk_cover_img": produkCoverImg,
      "produk_harga": produkHarga,
      "satuan_dasar_id": satuanDasarId,
      "min_stok": minStock,
      "max_stok": maxStock,
      "alias": alias,
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
                    getListProduct(context, "1");
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

  Future<void> postAddSiapJual(
    BuildContext context,
    String produkNama,
    String produkHarga,
    String produkGroupId,
    // String inputRoleId,
    String salesGroupId,
    String produkCoverImage,
    String produkImage1,
    String produkImage2,
    String produkImage3,
    String produkImage4,
    String kitchenId,
    String ranking,
    String satuanDasarId,
    String minStock,
    String maxStock,
    String favSt,
    String alias,
  ) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postAddProduct, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "produk_nama": produkNama,
      "produk_harga": produkHarga,
      "produk_group_id": produkGroupId,
      // "input_role_id": inputRoleId,
      "sales_group_id": salesGroupId,
      "produk_cover_img": produkCoverImage,
      "produk_img_1": produkImage1,
      "produk_img_2": produkImage2,
      "produk_img_3": produkImage3,
      "produk_img_4": produkImage4,
      "produk_img_5": "",
      "kitchen_id": kitchenId,
      "ranking": ranking,
      "satuan_dasar_id": satuanDasarId,
      "min_stok": minStock,
      "max_stok": maxStock,
      "fav_st": favSt,
      "alias": alias,
    });

    try {
      if (_response.data['notif_st'] == true) {
        pg.dismiss();
        Navigator.pop(context);
        getListProduct(context, "3");
        showSnackBar(
            snackBarType: SnackBarType.SUCCESS,
            title: 'Information',
            message: 'Success');
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

  Future<void> postAddHasilProduksi(
      BuildContext context,
      String produkNama,
      String produkHarga,
      String produkGroupId,
      String salesGroupId,
      String produkCoverImage,
      String produkImage1,
      String produkImage2,
      String produkImage3,
      String produkImage4,
      String kitchenId,
      String ranking,
      String resep,
      String countResep,
      String minStock,
      String maxStock,
      String favSt,
      String alias) async {
    Dio _dio = Dio(options);

    ProgressDialog pg = ProgressDialog(context,
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)),
        title: null);
    pg.show();

    _response = await _dio.post(BaseUrl.postAddProduct, data: {
      "user_id": await getUserId(),
      "role_id": await getRoleId(),
      "token": await getToken(),
      "token_key": await getTokenKey(),
      "produk_nama": produkNama,
      "produk_harga": produkHarga,
      "produk_group_id": produkGroupId,
      // "input_role_id": inputRoleId,
      "sales_group_id": salesGroupId,
      "produk_cover_img": produkCoverImage,
      "produk_img_1": produkImage1,
      "produk_img_2": produkImage2,
      "produk_img_3": produkImage3,
      "produk_img_4": produkImage4,
      "produk_img_5": "",
      "kitchen_id": kitchenId,
      "ranking": ranking,
      "resep": resep,
      "count_resep": countResep,
      "min_stok": minStock,
      "max_stok": maxStock,
      "fav_st": favSt,
      "alias": alias,
    });

    try {
      if (_response.data['notif_st'] == true) {
        pg.dismiss();
        Navigator.pop(context);
        getListProduct(context, "2");
        showSnackBar(
            snackBarType: SnackBarType.SUCCESS,
            title: 'Information',
            message: 'Success');
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

  Io.File? get fileImgAddBahanBaku => _fileImgAddBahanBaku;

  set fileImgAddBahanBaku(Io.File? value) {
    _fileImgAddBahanBaku = value;
    notifyListeners();
  }

  String? get imgAddBahanBaku => _imgAddBahanBaku;

  set imgAddBahanBaku(String? value) {
    _imgAddBahanBaku = value;
    notifyListeners();
  }

  Io.File? get fileImgSiapJual1 => _fileImgSiapJual1;

  set fileImgSiapJual1(Io.File? value) {
    _fileImgSiapJual1 = value;
    notifyListeners();
  }

  Io.File? get fileImgHasilProduksi1 => _fileImgHasilProduksi1;

  set fileImgHasilProduksi1(Io.File? value) {
    _fileImgHasilProduksi1 = value;
    notifyListeners();
  }

  Io.File? get fileImgHasilProduksi2 => _fileImgHasilProduksi2;

  set fileImgHasilProduksi2(Io.File? value) {
    _fileImgHasilProduksi2 = value;
    notifyListeners();
  }

  Io.File? get fileImgHasilProduksi3 => _fileImgHasilProduksi3;

  set fileImgHasilProduksi3(Io.File? value) {
    _fileImgHasilProduksi3 = value;
    notifyListeners();
  }

  Io.File? get fileImgHasilProduksi4 => _fileImgHasilProduksi4;

  set fileImgHasilProduksi4(Io.File? value) {
    _fileImgHasilProduksi4 = value;
    notifyListeners();
  }

  Io.File? get fileImgHasilProduksi5 => _fileImgHasilProduksi5;

  set fileImgHasilProduksi5(Io.File? value) {
    _fileImgHasilProduksi5 = value;
    notifyListeners();
  }

  String? get imgHasilProduksi1 => _imgHasilProduksi1;

  set imgHasilProduksi1(String? value) {
    _imgHasilProduksi1 = value;
    notifyListeners();
  }

  String? get imgHasilProduksi2 => _imgHasilProduksi2;

  set imgHasilProduksi2(String? value) {
    _imgHasilProduksi2 = value;
    notifyListeners();
  }

  String? get imgHasilProduksi3 => _imgHasilProduksi3;

  set imgHasilProduksi3(String? value) {
    _imgHasilProduksi3 = value;
    notifyListeners();
  }

  String? get imgHasilProduksi4 => _imgHasilProduksi4;

  set imgHasilProduksi4(String? value) {
    _imgHasilProduksi4 = value;
    notifyListeners();
  }

  String? get imgHasilProduksi5 => _imgHasilProduksi5;

  set imgHasilProduksi5(String? value) {
    _imgHasilProduksi5 = value;
    notifyListeners();
  }

  String? get imgCoverHasilProduksi => _imgCoverHasilProduksi;

  set imgCoverHasilProduksi(String? value) {
    _imgCoverHasilProduksi = value;
    notifyListeners();
  }

  Io.File? get fileImgCoverHasilProduksi => _fileImgCoverHasilProduksi;

  set fileImgCoverHasilProduksi(Io.File? value) {
    _fileImgCoverHasilProduksi = value;
    notifyListeners();
  }

  Io.File? get fileImgSiapJual2 => _fileImgSiapJual2;

  set fileImgSiapJual2(Io.File? value) {
    _fileImgSiapJual2 = value;
    notifyListeners();
  }

  List<dynamic> get listDataRetail => _listDataRetail;

  set listDataRetail(List<dynamic> value) {
    _listDataRetail = value;
    notifyListeners();
  }

  Io.File? get fileImgSiapJual3 => _fileImgSiapJual3;

  set fileImgSiapJual3(Io.File? value) {
    _fileImgSiapJual3 = value;
    notifyListeners();
  }

  Io.File? get fileImgSiapJual4 => _fileImgSiapJual4;

  set fileImgSiapJual4(Io.File? value) {
    _fileImgSiapJual4 = value;
    notifyListeners();
  }

  Io.File? get fileImgSiapJual5 => _fileImgSiapJual5;

  set fileImgSiapJual5(Io.File? value) {
    _fileImgSiapJual5 = value;
    notifyListeners();
  }

  String? get imgSiapJual1 => _imgSiapJual1;

  set imgSiapJual1(String? value) {
    _imgSiapJual1 = value;
    notifyListeners();
  }

  String? get imgSiapJual2 => _imgSiapJual2;

  set imgSiapJual2(String? value) {
    _imgSiapJual2 = value;
    notifyListeners();
  }

  String? get imgSiapJual3 => _imgSiapJual3;

  set imgSiapJual3(String? value) {
    _imgSiapJual3 = value;
    notifyListeners();
  }

  String? get imgSiapJual4 => _imgSiapJual4;

  set imgSiapJual4(String? value) {
    _imgSiapJual4 = value;
    notifyListeners();
  }

  String? get imgSiapJual5 => _imgSiapJual5;

  set imgSiapJual5(String? value) {
    _imgSiapJual5 = value;
    notifyListeners();
  }

  List<FormRetail> get formRetail => _formRetail;

  set formRetail(List<FormRetail> value) {
    _formRetail = value;
    notifyListeners();
  }

  ModelListProductGroup? get modelListProductGroup => _modelListProductGroup;

  set modelListProductGroup(ModelListProductGroup? value) {
    _modelListProductGroup = value;
    notifyListeners();
  }

  Io.File? get fileImgCoverAddSiapJual => _fileImgCoverAddSiapJual;

  set fileImgCoverAddSiapJual(Io.File? value) {
    _fileImgCoverAddSiapJual = value;
    notifyListeners();
  }

  String? get imgCoverAddSiapJual => _imgCoverAddSiapJual;

  set imgCoverAddSiapJual(String? value) {
    _imgCoverAddSiapJual = value;
    notifyListeners();
  }

  String? get subProductGroupId => _subProductGroupId;

  set subProductGroupId(String? value) {
    _subProductGroupId = value;
    notifyListeners();
  }

  ModelDataAdd? get modelDataAdd => _modelDataAdd;

  set modelDataAdd(ModelDataAdd? value) {
    _modelDataAdd = value;
    notifyListeners();
  }

  ModelListProduct? get modelListProduct => _modelListProduct;

  set modelListProduct(ModelListProduct? value) {
    _modelListProduct = value;
    notifyListeners();
  }

  List<dynamic> get listDataFormResep => _listDataFormResep;

  set listDataFormResep(List<dynamic> value) {
    _listDataFormResep = value;
    notifyListeners();
  }

  List<FormResep> get formResep => _formResep;

  set formResep(List<FormResep> value) {
    _formResep = value;
    notifyListeners();
  }

  ModelDetailProduct? get modelDetailProduct => _modelDetailProduct;

  set modelDetailProduct(ModelDetailProduct? value) {
    _modelDetailProduct = value;
    notifyListeners();
  }

  bool get favStatus => _favStatus;

  set favStatus(bool value) {
    _favStatus = value;
    notifyListeners();
  }
}

class FormRetail {
  String? selectedItem;

  FormRetail({required this.selectedItem});
}

class FormRoleId {
  String? selectedItem;

  FormRoleId({required this.selectedItem});
}

class FormResep {
  String? selectedItemBahanBaku;
  final TextEditingController qtyController;
  String? selectedItemUnit;

  FormResep(
      {required this.selectedItemBahanBaku,
      required this.qtyController,
      required this.selectedItemUnit});
}
