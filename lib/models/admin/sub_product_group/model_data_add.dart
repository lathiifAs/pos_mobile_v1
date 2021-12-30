/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : [{"array_produk_group":[{"produk_group_id":4,"group_id":"3","produk_group_nama":"Tes Kategori 2","produk_group_desc":"Tes","aktif_st":"1"},{"produk_group_id":10,"group_id":"4","produk_group_nama":"chchfyf","produk_group_desc":"hxhxydyfy","aktif_st":"1"}]}]

class ModelDataAdd {
  bool? _notifSt;
  String? _notifMsg;
  List<Data>? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  List<Data>? get data => _data;

  ModelDataAdd({
      bool? notifSt, 
      String? notifMsg, 
      List<Data>? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelDataAdd.fromJson(dynamic json) {
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

/// array_produk_group : [{"produk_group_id":4,"group_id":"3","produk_group_nama":"Tes Kategori 2","produk_group_desc":"Tes","aktif_st":"1"},{"produk_group_id":10,"group_id":"4","produk_group_nama":"chchfyf","produk_group_desc":"hxhxydyfy","aktif_st":"1"}]

class Data {
  List<Array_produk_group>? _arrayProdukGroup;

  List<Array_produk_group>? get arrayProdukGroup => _arrayProdukGroup;

  Data({
      List<Array_produk_group>? arrayProdukGroup}){
    _arrayProdukGroup = arrayProdukGroup;
}

  Data.fromJson(dynamic json) {
    if (json["array_produk_group"] != null) {
      _arrayProdukGroup = [];
      json["array_produk_group"].forEach((v) {
        _arrayProdukGroup?.add(Array_produk_group.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayProdukGroup != null) {
      map["array_produk_group"] = _arrayProdukGroup?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// produk_group_id : 4
/// group_id : "3"
/// produk_group_nama : "Tes Kategori 2"
/// produk_group_desc : "Tes"
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