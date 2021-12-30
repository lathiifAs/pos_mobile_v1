/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : [{"array_konversi":[{"konversi_id":1,"satuan_besar_id":1,"satuan_besar_qty":1,"satuan_kecil_id":2,"satuan_kecil_qty":1000,"nama_satuan_besar":"Kg","nama_satuan_kecil":"Gram"}]}]

class ModelListKonversi {
  bool? _notifSt;
  String? _notifMsg;
  List<Data>? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  List<Data>? get data => _data;

  ModelListKonversi({
      bool? notifSt, 
      String? notifMsg, 
      List<Data>? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelListKonversi.fromJson(dynamic json) {
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

/// array_konversi : [{"konversi_id":1,"satuan_besar_id":1,"satuan_besar_qty":1,"satuan_kecil_id":2,"satuan_kecil_qty":1000,"nama_satuan_besar":"Kg","nama_satuan_kecil":"Gram"}]

class Data {
  List<Array_konversi>? _arrayKonversi;

  List<Array_konversi>? get arrayKonversi => _arrayKonversi;

  Data({
      List<Array_konversi>? arrayKonversi}){
    _arrayKonversi = arrayKonversi;
}

  Data.fromJson(dynamic json) {
    if (json["array_konversi"] != null) {
      _arrayKonversi = [];
      json["array_konversi"].forEach((v) {
        _arrayKonversi?.add(Array_konversi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayKonversi != null) {
      map["array_konversi"] = _arrayKonversi?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// konversi_id : 1
/// satuan_besar_id : 1
/// satuan_besar_qty : 1
/// satuan_kecil_id : 2
/// satuan_kecil_qty : 1000
/// nama_satuan_besar : "Kg"
/// nama_satuan_kecil : "Gram"

class Array_konversi {
  int? _konversiId;
  int? _satuanBesarId;
  int? _satuanBesarQty;
  int? _satuanKecilId;
  int? _satuanKecilQty;
  String? _namaSatuanBesar;
  String? _namaSatuanKecil;

  int? get konversiId => _konversiId;
  int? get satuanBesarId => _satuanBesarId;
  int? get satuanBesarQty => _satuanBesarQty;
  int? get satuanKecilId => _satuanKecilId;
  int? get satuanKecilQty => _satuanKecilQty;
  String? get namaSatuanBesar => _namaSatuanBesar;
  String? get namaSatuanKecil => _namaSatuanKecil;

  Array_konversi({
      int? konversiId, 
      int? satuanBesarId, 
      int? satuanBesarQty, 
      int? satuanKecilId, 
      int? satuanKecilQty, 
      String? namaSatuanBesar, 
      String? namaSatuanKecil}){
    _konversiId = konversiId;
    _satuanBesarId = satuanBesarId;
    _satuanBesarQty = satuanBesarQty;
    _satuanKecilId = satuanKecilId;
    _satuanKecilQty = satuanKecilQty;
    _namaSatuanBesar = namaSatuanBesar;
    _namaSatuanKecil = namaSatuanKecil;
}

  Array_konversi.fromJson(dynamic json) {
    _konversiId = json["konversi_id"];
    _satuanBesarId = json["satuan_besar_id"];
    _satuanBesarQty = json["satuan_besar_qty"];
    _satuanKecilId = json["satuan_kecil_id"];
    _satuanKecilQty = json["satuan_kecil_qty"];
    _namaSatuanBesar = json["nama_satuan_besar"];
    _namaSatuanKecil = json["nama_satuan_kecil"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["konversi_id"] = _konversiId;
    map["satuan_besar_id"] = _satuanBesarId;
    map["satuan_besar_qty"] = _satuanBesarQty;
    map["satuan_kecil_id"] = _satuanKecilId;
    map["satuan_kecil_qty"] = _satuanKecilQty;
    map["nama_satuan_besar"] = _namaSatuanBesar;
    map["nama_satuan_kecil"] = _namaSatuanKecil;
    return map;
  }

}