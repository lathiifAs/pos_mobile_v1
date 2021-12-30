/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"result":{"jenis_pembayaran_id":1,"jenis_pembayaran_nama":"Cash","jenis_pembayaran_desc":""}}

class ModelDataEditJenisPembayaran {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelDataEditJenisPembayaran({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelDataEditJenisPembayaran.fromJson(dynamic json) {
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

/// result : {"jenis_pembayaran_id":1,"jenis_pembayaran_nama":"Cash","jenis_pembayaran_desc":""}

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

/// jenis_pembayaran_id : 1
/// jenis_pembayaran_nama : "Cash"
/// jenis_pembayaran_desc : ""

class Result {
  int? _jenisPembayaranId;
  String? _jenisPembayaranNama;
  String? _jenisPembayaranDesc;

  int? get jenisPembayaranId => _jenisPembayaranId;
  String? get jenisPembayaranNama => _jenisPembayaranNama;
  String? get jenisPembayaranDesc => _jenisPembayaranDesc;

  Result({
      int? jenisPembayaranId, 
      String? jenisPembayaranNama, 
      String? jenisPembayaranDesc}){
    _jenisPembayaranId = jenisPembayaranId;
    _jenisPembayaranNama = jenisPembayaranNama;
    _jenisPembayaranDesc = jenisPembayaranDesc;
}

  Result.fromJson(dynamic json) {
    _jenisPembayaranId = json["jenis_pembayaran_id"];
    _jenisPembayaranNama = json["jenis_pembayaran_nama"];
    _jenisPembayaranDesc = json["jenis_pembayaran_desc"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["jenis_pembayaran_id"] = _jenisPembayaranId;
    map["jenis_pembayaran_nama"] = _jenisPembayaranNama;
    map["jenis_pembayaran_desc"] = _jenisPembayaranDesc;
    return map;
  }

}