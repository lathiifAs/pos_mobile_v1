/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"array_group":[{"group_id":"3","group_nama":"Cafe dan Resto","group_desc":null},{"group_id":"4","group_nama":"Retail Bakery","group_desc":null}],"result":{"diskon_id":9,"group_id":"3","diskon_nama":"discount name","diskon_desc":"description","sales_group_id":7,"produk_id":null,"diskon_syarat_jml_pembelian":50000,"diskon_tgl_mulai":"2021-08-17T17:00:00.000Z","diskon_tgl_exp":"2021-08-19T17:00:00.000Z","diskon_jam_mulai":"00:00:00","diskon_jam_exp":"00:00:00","diskon_presentase":50,"diskon_file":"E8mZyM0gEG-1629251291942.jpg","diskon_path":"/doc/gambar_diskon/","group_nama":"Cafe dan Resto","sales_group_nama":"Makanan","produk_nama":null}}

class ModelDataEdit {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelDataEdit({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelDataEdit.fromJson(dynamic json) {
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

/// array_group : [{"group_id":"3","group_nama":"Cafe dan Resto","group_desc":null},{"group_id":"4","group_nama":"Retail Bakery","group_desc":null}]
/// result : {"diskon_id":9,"group_id":"3","diskon_nama":"discount name","diskon_desc":"description","sales_group_id":7,"produk_id":null,"diskon_syarat_jml_pembelian":50000,"diskon_tgl_mulai":"2021-08-17T17:00:00.000Z","diskon_tgl_exp":"2021-08-19T17:00:00.000Z","diskon_jam_mulai":"00:00:00","diskon_jam_exp":"00:00:00","diskon_presentase":50,"diskon_file":"E8mZyM0gEG-1629251291942.jpg","diskon_path":"/doc/gambar_diskon/","group_nama":"Cafe dan Resto","sales_group_nama":"Makanan","produk_nama":null}

class Data {
  List<Array_group>? _arrayGroup;
  Result? _result;

  List<Array_group>? get arrayGroup => _arrayGroup;
  Result? get result => _result;

  Data({
      List<Array_group>? arrayGroup, 
      Result? result}){
    _arrayGroup = arrayGroup;
    _result = result;
}

  Data.fromJson(dynamic json) {
    if (json["array_group"] != null) {
      _arrayGroup = [];
      json["array_group"].forEach((v) {
        _arrayGroup?.add(Array_group.fromJson(v));
      });
    }
    _result = json["result"] != null ? Result.fromJson(json["result"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayGroup != null) {
      map["array_group"] = _arrayGroup?.map((v) => v.toJson()).toList();
    }
    if (_result != null) {
      map["result"] = _result?.toJson();
    }
    return map;
  }

}

/// diskon_id : 9
/// group_id : "3"
/// diskon_nama : "discount name"
/// diskon_desc : "description"
/// sales_group_id : 7
/// produk_id : null
/// diskon_syarat_jml_pembelian : 50000
/// diskon_tgl_mulai : "2021-08-17T17:00:00.000Z"
/// diskon_tgl_exp : "2021-08-19T17:00:00.000Z"
/// diskon_jam_mulai : "00:00:00"
/// diskon_jam_exp : "00:00:00"
/// diskon_presentase : 50
/// diskon_file : "E8mZyM0gEG-1629251291942.jpg"
/// diskon_path : "/doc/gambar_diskon/"
/// group_nama : "Cafe dan Resto"
/// sales_group_nama : "Makanan"
/// produk_nama : null

class Result {
  int? _diskonId;
  String? _groupId;
  String? _diskonNama;
  String? _diskonDesc;
  int? _salesGroupId;
  dynamic? _produkId;
  int? _diskonSyaratJmlPembelian;
  String? _diskonTglMulai;
  String? _diskonTglExp;
  String? _diskonJamMulai;
  String? _diskonJamExp;
  int? _diskonPresentase;
  String? _diskonFile;
  String? _diskonPath;
  String? _groupNama;
  String? _salesGroupNama;
  dynamic? _produkNama;

  int? get diskonId => _diskonId;
  String? get groupId => _groupId;
  String? get diskonNama => _diskonNama;
  String? get diskonDesc => _diskonDesc;
  int? get salesGroupId => _salesGroupId;
  dynamic? get produkId => _produkId;
  int? get diskonSyaratJmlPembelian => _diskonSyaratJmlPembelian;
  String? get diskonTglMulai => _diskonTglMulai;
  String? get diskonTglExp => _diskonTglExp;
  String? get diskonJamMulai => _diskonJamMulai;
  String? get diskonJamExp => _diskonJamExp;
  int? get diskonPresentase => _diskonPresentase;
  String? get diskonFile => _diskonFile;
  String? get diskonPath => _diskonPath;
  String? get groupNama => _groupNama;
  String? get salesGroupNama => _salesGroupNama;
  dynamic? get produkNama => _produkNama;

  Result({
      int? diskonId, 
      String? groupId, 
      String? diskonNama, 
      String? diskonDesc, 
      int? salesGroupId, 
      dynamic? produkId, 
      int? diskonSyaratJmlPembelian, 
      String? diskonTglMulai, 
      String? diskonTglExp, 
      String? diskonJamMulai, 
      String? diskonJamExp, 
      int? diskonPresentase, 
      String? diskonFile, 
      String? diskonPath, 
      String? groupNama, 
      String? salesGroupNama, 
      dynamic? produkNama}){
    _diskonId = diskonId;
    _groupId = groupId;
    _diskonNama = diskonNama;
    _diskonDesc = diskonDesc;
    _salesGroupId = salesGroupId;
    _produkId = produkId;
    _diskonSyaratJmlPembelian = diskonSyaratJmlPembelian;
    _diskonTglMulai = diskonTglMulai;
    _diskonTglExp = diskonTglExp;
    _diskonJamMulai = diskonJamMulai;
    _diskonJamExp = diskonJamExp;
    _diskonPresentase = diskonPresentase;
    _diskonFile = diskonFile;
    _diskonPath = diskonPath;
    _groupNama = groupNama;
    _salesGroupNama = salesGroupNama;
    _produkNama = produkNama;
}

  Result.fromJson(dynamic json) {
    _diskonId = json["diskon_id"];
    _groupId = json["group_id"];
    _diskonNama = json["diskon_nama"];
    _diskonDesc = json["diskon_desc"];
    _salesGroupId = json["sales_group_id"];
    _produkId = json["produk_id"];
    _diskonSyaratJmlPembelian = json["diskon_syarat_jml_pembelian"];
    _diskonTglMulai = json["diskon_tgl_mulai"];
    _diskonTglExp = json["diskon_tgl_exp"];
    _diskonJamMulai = json["diskon_jam_mulai"];
    _diskonJamExp = json["diskon_jam_exp"];
    _diskonPresentase = json["diskon_presentase"];
    _diskonFile = json["diskon_file"];
    _diskonPath = json["diskon_path"];
    _groupNama = json["group_nama"];
    _salesGroupNama = json["sales_group_nama"];
    _produkNama = json["produk_nama"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["diskon_id"] = _diskonId;
    map["group_id"] = _groupId;
    map["diskon_nama"] = _diskonNama;
    map["diskon_desc"] = _diskonDesc;
    map["sales_group_id"] = _salesGroupId;
    map["produk_id"] = _produkId;
    map["diskon_syarat_jml_pembelian"] = _diskonSyaratJmlPembelian;
    map["diskon_tgl_mulai"] = _diskonTglMulai;
    map["diskon_tgl_exp"] = _diskonTglExp;
    map["diskon_jam_mulai"] = _diskonJamMulai;
    map["diskon_jam_exp"] = _diskonJamExp;
    map["diskon_presentase"] = _diskonPresentase;
    map["diskon_file"] = _diskonFile;
    map["diskon_path"] = _diskonPath;
    map["group_nama"] = _groupNama;
    map["sales_group_nama"] = _salesGroupNama;
    map["produk_nama"] = _produkNama;
    return map;
  }

}

/// group_id : "3"
/// group_nama : "Cafe dan Resto"
/// group_desc : null

class Array_group {
  String? _groupId;
  String? _groupNama;
  dynamic? _groupDesc;

  String? get groupId => _groupId;
  String? get groupNama => _groupNama;
  dynamic? get groupDesc => _groupDesc;

  Array_group({
      String? groupId, 
      String? groupNama, 
      dynamic? groupDesc}){
    _groupId = groupId;
    _groupNama = groupNama;
    _groupDesc = groupDesc;
}

  Array_group.fromJson(dynamic json) {
    _groupId = json["group_id"];
    _groupNama = json["group_nama"];
    _groupDesc = json["group_desc"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["group_id"] = _groupId;
    map["group_nama"] = _groupNama;
    map["group_desc"] = _groupDesc;
    return map;
  }

}