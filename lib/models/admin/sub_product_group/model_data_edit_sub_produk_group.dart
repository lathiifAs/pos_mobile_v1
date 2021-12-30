/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"result":{"sub_produk_group_id":6,"produk_group_id":4,"sub_produk_group_nama":"Tes sub Kategori","sub_produk_group_desc":"Tes","aktif_st":"1","produk_group_nama":"Tes Kategori 2"},"array_produk_group":[{"produk_group_id":10,"group_id":"4","produk_group_nama":"chchfyf","produk_group_desc":"hxhxydyfy","aktif_st":"1"}]}

class ModelDataEditSubProdukGroup {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelDataEditSubProdukGroup({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelDataEditSubProdukGroup.fromJson(dynamic json) {
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

/// result : {"sub_produk_group_id":6,"produk_group_id":4,"sub_produk_group_nama":"Tes sub Kategori","sub_produk_group_desc":"Tes","aktif_st":"1","produk_group_nama":"Tes Kategori 2"}
/// array_produk_group : [{"produk_group_id":10,"group_id":"4","produk_group_nama":"chchfyf","produk_group_desc":"hxhxydyfy","aktif_st":"1"}]

class Data {
  Result? _result;
  List<Array_produk_group>? _arrayProdukGroup;

  Result? get result => _result;
  List<Array_produk_group>? get arrayProdukGroup => _arrayProdukGroup;

  Data({
      Result? result, 
      List<Array_produk_group>? arrayProdukGroup}){
    _result = result;
    _arrayProdukGroup = arrayProdukGroup;
}

  Data.fromJson(dynamic json) {
    _result = json["result"] != null ? Result.fromJson(json["result"]) : null;
    if (json["array_produk_group"] != null) {
      _arrayProdukGroup = [];
      json["array_produk_group"].forEach((v) {
        _arrayProdukGroup?.add(Array_produk_group.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_result != null) {
      map["result"] = _result?.toJson();
    }
    if (_arrayProdukGroup != null) {
      map["array_produk_group"] = _arrayProdukGroup?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// produk_group_id : 10
/// group_id : "4"
/// produk_group_nama : "chchfyf"
/// produk_group_desc : "hxhxydyfy"
/// aktif_st : "1"

class Array_produk_group {
  int? _produkGroupId;
  String? _groupId;
  String? _produkGroupNama;
  String? _produkGroupDesc;
  String? _aktifSt;

  int? get produkGroupId => _produkGroupId;
  String? get groupId => _groupId;
  String? get produkGroupNama => _produkGroupNama;
  String? get produkGroupDesc => _produkGroupDesc;
  String? get aktifSt => _aktifSt;

  Array_produk_group({
      int? produkGroupId, 
      String? groupId, 
      String? produkGroupNama, 
      String? produkGroupDesc, 
      String? aktifSt}){
    _produkGroupId = produkGroupId;
    _groupId = groupId;
    _produkGroupNama = produkGroupNama;
    _produkGroupDesc = produkGroupDesc;
    _aktifSt = aktifSt;
}

  Array_produk_group.fromJson(dynamic json) {
    _produkGroupId = json["produk_group_id"];
    _groupId = json["group_id"];
    _produkGroupNama = json["produk_group_nama"];
    _produkGroupDesc = json["produk_group_desc"];
    _aktifSt = json["aktif_st"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["produk_group_id"] = _produkGroupId;
    map["group_id"] = _groupId;
    map["produk_group_nama"] = _produkGroupNama;
    map["produk_group_desc"] = _produkGroupDesc;
    map["aktif_st"] = _aktifSt;
    return map;
  }

}

/// sub_produk_group_id : 6
/// produk_group_id : 4
/// sub_produk_group_nama : "Tes sub Kategori"
/// sub_produk_group_desc : "Tes"
/// aktif_st : "1"
/// produk_group_nama : "Tes Kategori 2"

class Result {
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

  Result({
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

  Result.fromJson(dynamic json) {
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