/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"result":{"satuan_id":1,"satuan_nama":"Kg"}}

class ModelEditSatuan {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelEditSatuan({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelEditSatuan.fromJson(dynamic json) {
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

/// result : {"satuan_id":1,"satuan_nama":"Kg"}

class Data {
  Result? _result;

  Result? get result => _result;

  Data({
      Result? result}){
    _result = result;
}

  Data.fromJson(dynamic json) {
    _result = json["result"] != null ? Result.fromJson(json["result"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_result != null) {
      map["result"] = _result?.toJson();
    }
    return map;
  }

}

/// satuan_id : 1
/// satuan_nama : "Kg"

class Result {
  int? _satuanId;
  String? _satuanNama;

  int? get satuanId => _satuanId;
  String? get satuanNama => _satuanNama;

  Result({
      int? satuanId, 
      String? satuanNama}){
    _satuanId = satuanId;
    _satuanNama = satuanNama;
}

  Result.fromJson(dynamic json) {
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