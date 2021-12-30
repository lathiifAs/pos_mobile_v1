/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"array_produk":[{"produk_id":77,"produk_group_id":1,"sub_produk_group_id":14,"kitchen_id":null,"sales_group_id":null,"produk_nama":"Kentang","produk_harga":12000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":1000,"aktif_st":"1","ranking":null,"satuan_id":1,"produk_group_nama":"Bahan baku","produk_group_desc":"","retail_st":"0"}]}

class ModelListProduct {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelListProduct({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelListProduct.fromJson(dynamic json) {
    _notifSt = json["notif_st"];
    _notifMsg = json["notif_msg"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["notif_st"] = _notifSt;
    map["notif_msg"] = _notifMsg;
    if (_data != null) {
      map["data"] = _data?.toJson();
    }
    return map;
  }

}

/// array_produk : [{"produk_id":77,"produk_group_id":1,"sub_produk_group_id":14,"kitchen_id":null,"sales_group_id":null,"produk_nama":"Kentang","produk_harga":12000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":1000,"aktif_st":"1","ranking":null,"satuan_id":1,"produk_group_nama":"Bahan baku","produk_group_desc":"","retail_st":"0"}]

class Data {
  List<Array_produk>? _arrayProduk;

  List<Array_produk>? get arrayProduk => _arrayProduk;

  Data({
      List<Array_produk>? arrayProduk}){
    _arrayProduk = arrayProduk;
}

  Data.fromJson(dynamic json) {
    if (json["array_produk"] != null) {
      _arrayProduk = [];
      json["array_produk"].forEach((v) {
        _arrayProduk?.add(Array_produk.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayProduk != null) {
      map["array_produk"] = _arrayProduk?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// produk_id : 77
/// produk_group_id : 1
/// sub_produk_group_id : 14
/// kitchen_id : null
/// sales_group_id : null
/// produk_nama : "Kentang"
/// produk_harga : 12000
/// produk_gambar_nama : "hdPGT6YTFB-1630756076109.jpg"
/// produk_gambar_path : "/doc/produk_img/"
/// stok : 1000
/// aktif_st : "1"
/// ranking : null
/// satuan_id : 1
/// produk_group_nama : "Bahan baku"
/// produk_group_desc : ""
/// retail_st : "0"

class Array_produk {
  int? _produkId;
  int? _produkGroupId;
  int? _subProdukGroupId;
  dynamic? _kitchenId;
  dynamic? _salesGroupId;
  String? _produkNama;
  int? _produkHarga;
  String? _produkGambarNama;
  String? _produkGambarPath;
  int? _stok;
  String? _aktifSt;
  dynamic? _ranking;
  int? _satuanId;
  String? _produkGroupNama;
  String? _produkGroupDesc;
  String? _retailSt;

  int? get produkId => _produkId;
  int? get produkGroupId => _produkGroupId;
  int? get subProdukGroupId => _subProdukGroupId;
  dynamic? get kitchenId => _kitchenId;
  dynamic? get salesGroupId => _salesGroupId;
  String? get produkNama => _produkNama;
  int? get produkHarga => _produkHarga;
  String? get produkGambarNama => _produkGambarNama;
  String? get produkGambarPath => _produkGambarPath;
  int? get stok => _stok;
  String? get aktifSt => _aktifSt;
  dynamic? get ranking => _ranking;
  int? get satuanId => _satuanId;
  String? get produkGroupNama => _produkGroupNama;
  String? get produkGroupDesc => _produkGroupDesc;
  String? get retailSt => _retailSt;

  Array_produk({
      int? produkId, 
      int? produkGroupId, 
      int? subProdukGroupId, 
      dynamic? kitchenId, 
      dynamic? salesGroupId, 
      String? produkNama, 
      int? produkHarga, 
      String? produkGambarNama, 
      String? produkGambarPath, 
      int? stok, 
      String? aktifSt, 
      dynamic? ranking, 
      int? satuanId, 
      String? produkGroupNama, 
      String? produkGroupDesc, 
      String? retailSt}){
    _produkId = produkId;
    _produkGroupId = produkGroupId;
    _subProdukGroupId = subProdukGroupId;
    _kitchenId = kitchenId;
    _salesGroupId = salesGroupId;
    _produkNama = produkNama;
    _produkHarga = produkHarga;
    _produkGambarNama = produkGambarNama;
    _produkGambarPath = produkGambarPath;
    _stok = stok;
    _aktifSt = aktifSt;
    _ranking = ranking;
    _satuanId = satuanId;
    _produkGroupNama = produkGroupNama;
    _produkGroupDesc = produkGroupDesc;
    _retailSt = retailSt;
}

  Array_produk.fromJson(dynamic json) {
    _produkId = json["produk_id"];
    _produkGroupId = json["produk_group_id"];
    _subProdukGroupId = json["sub_produk_group_id"];
    _kitchenId = json["kitchen_id"];
    _salesGroupId = json["sales_group_id"];
    _produkNama = json["produk_nama"];
    _produkHarga = json["produk_harga"];
    _produkGambarNama = json["produk_gambar_nama"];
    _produkGambarPath = json["produk_gambar_path"];
    _stok = json["stok"];
    _aktifSt = json["aktif_st"];
    _ranking = json["ranking"];
    _satuanId = json["satuan_id"];
    _produkGroupNama = json["produk_group_nama"];
    _produkGroupDesc = json["produk_group_desc"];
    _retailSt = json["retail_st"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["produk_id"] = _produkId;
    map["produk_group_id"] = _produkGroupId;
    map["sub_produk_group_id"] = _subProdukGroupId;
    map["kitchen_id"] = _kitchenId;
    map["sales_group_id"] = _salesGroupId;
    map["produk_nama"] = _produkNama;
    map["produk_harga"] = _produkHarga;
    map["produk_gambar_nama"] = _produkGambarNama;
    map["produk_gambar_path"] = _produkGambarPath;
    map["stok"] = _stok;
    map["aktif_st"] = _aktifSt;
    map["ranking"] = _ranking;
    map["satuan_id"] = _satuanId;
    map["produk_group_nama"] = _produkGroupNama;
    map["produk_group_desc"] = _produkGroupDesc;
    map["retail_st"] = _retailSt;
    return map;
  }

}