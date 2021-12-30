/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : [{"array_satuan":[{"satuan_id":1,"satuan_nama":"Kg"}]}]

class ModelListSatuan {
  bool? _notifSt;
  String? _notifMsg;
  List<Data>? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  List<Data>? get data => _data;

  ModelListSatuan({
      bool? notifSt, 
      String? notifMsg, 
      List<Data>? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelListSatuan.fromJson(dynamic json) {
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

/// array_satuan : [{"satuan_id":1,"satuan_nama":"Kg"}]

class Data {
  List<Array_satuan>? _arraySatuan;

  List<Array_satuan>? get arraySatuan => _arraySatuan;

  Data({
      List<Array_satuan>? arraySatuan}){
    _arraySatuan = arraySatuan;
}

  Data.fromJson(dynamic json) {
    if (json["array_satuan"] != null) {
      _arraySatuan = [];
      json["array_satuan"].forEach((v) {
        _arraySatuan?.add(Array_satuan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arraySatuan != null) {
      map["array_satuan"] = _arraySatuan?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// satuan_id : 1
/// satuan_nama : "Kg"

class Array_satuan {
  int? _satuanId;
  String? _satuanNama;

  int? get satuanId => _satuanId;
  String? get satuanNama => _satuanNama;

  Array_satuan({
      int? satuanId, 
      String? satuanNama}){
    _satuanId = satuanId;
    _satuanNama = satuanNama;
}

  Array_satuan.fromJson(dynamic json) {
    _satuanId = json["satuan_id"];
    _satuanNama = json["satuan_nama"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["satuan_id"] = _satuanId;
    map["satuan_nama"] = _satuanNama;
    return map;
  }

}