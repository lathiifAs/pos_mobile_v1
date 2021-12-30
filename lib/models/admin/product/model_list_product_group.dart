/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"array_group_produk":[{"produk_group_id":1,"produk_group_nama":"Bahan baku","produk_group_desc":"","aktif_st":"1","retail_st":"0"},{"produk_group_id":2,"produk_group_nama":"Hasil Produksi","produk_group_desc":"Tes","aktif_st":"1","retail_st":"1"},{"produk_group_id":3,"produk_group_nama":"Siap Jual","produk_group_desc":"","aktif_st":"1","retail_st":"1"}]}

class ModelListProductGroup {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelListProductGroup({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelListProductGroup.fromJson(dynamic json) {
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

/// array_group_produk : [{"produk_group_id":1,"produk_group_nama":"Bahan baku","produk_group_desc":"","aktif_st":"1","retail_st":"0"},{"produk_group_id":2,"produk_group_nama":"Hasil Produksi","produk_group_desc":"Tes","aktif_st":"1","retail_st":"1"},{"produk_group_id":3,"produk_group_nama":"Siap Jual","produk_group_desc":"","aktif_st":"1","retail_st":"1"}]

class Data {
  List<Array_group_produk>? _arrayGroupProduk;

  List<Array_group_produk>? get arrayGroupProduk => _arrayGroupProduk;

  Data({
      List<Array_group_produk>? arrayGroupProduk}){
    _arrayGroupProduk = arrayGroupProduk;
}

  Data.fromJson(dynamic json) {
    if (json["array_group_produk"] != null) {
      _arrayGroupProduk = [];
      json["array_group_produk"].forEach((v) {
        _arrayGroupProduk?.add(Array_group_produk.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayGroupProduk != null) {
      map["array_group_produk"] = _arrayGroupProduk?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// produk_group_id : 1
/// produk_group_nama : "Bahan baku"
/// produk_group_desc : ""
/// aktif_st : "1"
/// retail_st : "0"

class Array_group_produk {
  int? _produkGroupId;
  String? _produkGroupNama;
  String? _produkGroupDesc;
  String? _aktifSt;
  String? _retailSt;

  int? get produkGroupId => _produkGroupId;
  String? get produkGroupNama => _produkGroupNama;
  String? get produkGroupDesc => _produkGroupDesc;
  String? get aktifSt => _aktifSt;
  String? get retailSt => _retailSt;

  Array_group_produk({
      int? produkGroupId, 
      String? produkGroupNama, 
      String? produkGroupDesc, 
      String? aktifSt, 
      String? retailSt}){
    _produkGroupId = produkGroupId;
    _produkGroupNama = produkGroupNama;
    _produkGroupDesc = produkGroupDesc;
    _aktifSt = aktifSt;
    _retailSt = retailSt;
}

  Array_group_produk.fromJson(dynamic json) {
    _produkGroupId = json["produk_group_id"];
    _produkGroupNama = json["produk_group_nama"];
    _produkGroupDesc = json["produk_group_desc"];
    _aktifSt = json["aktif_st"];
    _retailSt = json["retail_st"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["produk_group_id"] = _produkGroupId;
    map["produk_group_nama"] = _produkGroupNama;
    map["produk_group_desc"] = _produkGroupDesc;
    map["aktif_st"] = _aktifSt;
    map["retail_st"] = _retailSt;
    return map;
  }

}