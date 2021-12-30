/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : [{"array_sub_produk_group":[{"sub_produk_group_id":4,"produk_group_id":4,"sub_produk_group_nama":"Tes sub Kategori","sub_produk_group_desc":"Tes","aktif_st":"1","produk_group_nama":"Tes Kategori 2"}]}]

class ModelListSubProductGroup {
  bool? _notifSt;
  String? _notifMsg;
  List<Data>? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  List<Data>? get data => _data;

  ModelListSubProductGroup({
      bool? notifSt, 
      String? notifMsg, 
      List<Data>? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelListSubProductGroup.fromJson(dynamic json) {
    _notifSt = json["notif_st"];
    _notifMsg = json["notif_msg"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["notif_st"] = _notifSt;
    map["notif_msg"] = _notifMsg;
    if (_data != null) {
      map["data"] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// array_sub_produk_group : [{"sub_produk_group_id":4,"produk_group_id":4,"sub_produk_group_nama":"Tes sub Kategori","sub_produk_group_desc":"Tes","aktif_st":"1","produk_group_nama":"Tes Kategori 2"}]

class Data {
  List<Array_sub_produk_group>? _arraySubProdukGroup;

  List<Array_sub_produk_group>? get arraySubProdukGroup => _arraySubProdukGroup;

  Data({
      List<Array_sub_produk_group>? arraySubProdukGroup}){
    _arraySubProdukGroup = arraySubProdukGroup;
}

  Data.fromJson(dynamic json) {
    if (json["array_sub_produk_group"] != null) {
      _arraySubProdukGroup = [];
      json["array_sub_produk_group"].forEach((v) {
        _arraySubProdukGroup?.add(Array_sub_produk_group.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arraySubProdukGroup != null) {
      map["array_sub_produk_group"] = _arraySubProdukGroup?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// sub_produk_group_id : 4
/// produk_group_id : 4
/// sub_produk_group_nama : "Tes sub Kategori"
/// sub_produk_group_desc : "Tes"
/// aktif_st : "1"
/// produk_group_nama : "Tes Kategori 2"

class Array_sub_produk_group {
  int? _subProdukGroupId;
  int? _produkGroupId;
  String? _subProdukGroupNama;
  String? _subProdukGroupDesc;
  String? _aktifSt;
  String? _produkGroupNama;

  int? get subProdukGroupId => _subProdukGroupId;
  int? get produkGroupId => _produkGroupId;
  String? get subProdukGroupNama => _subProdukGroupNama;
  String? get subProdukGroupDesc => _subProdukGroupDesc;
  String? get aktifSt => _aktifSt;
  String? get produkGroupNama => _produkGroupNama;

  Array_sub_produk_group({
      int? subProdukGroupId, 
      int? produkGroupId, 
      String? subProdukGroupNama, 
      String? subProdukGroupDesc, 
      String? aktifSt, 
      String? produkGroupNama}){
    _subProdukGroupId = subProdukGroupId;
    _produkGroupId = produkGroupId;
    _subProdukGroupNama = subProdukGroupNama;
    _subProdukGroupDesc = subProdukGroupDesc;
    _aktifSt = aktifSt;
    _produkGroupNama = produkGroupNama;
}

  Array_sub_produk_group.fromJson(dynamic json) {
    _subProdukGroupId = json["sub_produk_group_id"];
    _produkGroupId = json["produk_group_id"];
    _subProdukGroupNama = json["sub_produk_group_nama"];
    _subProdukGroupDesc = json["sub_produk_group_desc"];
    _aktifSt = json["aktif_st"];
    _produkGroupNama = json["produk_group_nama"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["sub_produk_group_id"] = _subProdukGroupId;
    map["produk_group_id"] = _produkGroupId;
    map["sub_produk_group_nama"] = _subProdukGroupNama;
    map["sub_produk_group_desc"] = _subProdukGroupDesc;
    map["aktif_st"] = _aktifSt;
    map["produk_group_nama"] = _produkGroupNama;
    return map;
  }

}