/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : [{"array_jenis_pembayaran":[{"jenis_pembayaran_id":1,"jenis_pembayaran_nama":"Cash","jenis_pembayaran_desc":""}]}]

class ModelListJenisPembayaran {
  bool? _notifSt;
  String? _notifMsg;
  List<Data>? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  List<Data>? get data => _data;

  ModelListJenisPembayaran({
      bool? notifSt, 
      String? notifMsg, 
      List<Data>? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelListJenisPembayaran.fromJson(dynamic json) {
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

/// array_jenis_pembayaran : [{"jenis_pembayaran_id":1,"jenis_pembayaran_nama":"Cash","jenis_pembayaran_desc":""}]

class Data {
  List<Array_jenis_pembayaran>? _arrayJenisPembayaran;

  List<Array_jenis_pembayaran>? get arrayJenisPembayaran => _arrayJenisPembayaran;

  Data({
      List<Array_jenis_pembayaran>? arrayJenisPembayaran}){
    _arrayJenisPembayaran = arrayJenisPembayaran;
}

  Data.fromJson(dynamic json) {
    if (json["array_jenis_pembayaran"] != null) {
      _arrayJenisPembayaran = [];
      json["array_jenis_pembayaran"].forEach((v) {
        _arrayJenisPembayaran?.add(Array_jenis_pembayaran.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayJenisPembayaran != null) {
      map["array_jenis_pembayaran"] = _arrayJenisPembayaran?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// jenis_pembayaran_id : 1
/// jenis_pembayaran_nama : "Cash"
/// jenis_pembayaran_desc : ""

class Array_jenis_pembayaran {
  int? _jenisPembayaranId;
  String? _jenisPembayaranNama;
  String? _jenisPembayaranDesc;

  int? get jenisPembayaranId => _jenisPembayaranId;
  String? get jenisPembayaranNama => _jenisPembayaranNama;
  String? get jenisPembayaranDesc => _jenisPembayaranDesc;

  Array_jenis_pembayaran({
      int? jenisPembayaranId, 
      String? jenisPembayaranNama, 
      String? jenisPembayaranDesc}){
    _jenisPembayaranId = jenisPembayaranId;
    _jenisPembayaranNama = jenisPembayaranNama;
    _jenisPembayaranDesc = jenisPembayaranDesc;
}

  Array_jenis_pembayaran.fromJson(dynamic json) {
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