/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"result":{"konversi_id":1,"satuan_besar_id":1,"satuan_besar_qty":1,"satuan_kecil_id":2,"satuan_kecil_qty":1000}}

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

/// result : {"konversi_id":1,"satuan_besar_id":1,"satuan_besar_qty":1,"satuan_kecil_id":2,"satuan_kecil_qty":1000}

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

/// konversi_id : 1
/// satuan_besar_id : 1
/// satuan_besar_qty : 1
/// satuan_kecil_id : 2
/// satuan_kecil_qty : 1000

class Result {
  int? _konversiId;
  int? _satuanBesarId;
  int? _satuanBesarQty;
  int? _satuanKecilId;
  int? _satuanKecilQty;

  int? get konversiId => _konversiId;
  int? get satuanBesarId => _satuanBesarId;
  int? get satuanBesarQty => _satuanBesarQty;
  int? get satuanKecilId => _satuanKecilId;
  int? get satuanKecilQty => _satuanKecilQty;

  Result({
      int? konversiId, 
      int? satuanBesarId, 
      int? satuanBesarQty, 
      int? satuanKecilId, 
      int? satuanKecilQty}){
    _konversiId = konversiId;
    _satuanBesarId = satuanBesarId;
    _satuanBesarQty = satuanBesarQty;
    _satuanKecilId = satuanKecilId;
    _satuanKecilQty = satuanKecilQty;
}

  Result.fromJson(dynamic json) {
    _konversiId = json["konversi_id"];
    _satuanBesarId = json["satuan_besar_id"];
    _satuanBesarQty = json["satuan_besar_qty"];
    _satuanKecilId = json["satuan_kecil_id"];
    _satuanKecilQty = json["satuan_kecil_qty"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["konversi_id"] = _konversiId;
    map["satuan_besar_id"] = _satuanBesarId;
    map["satuan_besar_qty"] = _satuanBesarQty;
    map["satuan_kecil_id"] = _satuanKecilId;
    map["satuan_kecil_qty"] = _satuanKecilQty;
    return map;
  }

}