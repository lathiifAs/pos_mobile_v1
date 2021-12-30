/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"array_list":[{"gudang_asal":"Gudang Pusat","gudang_tujuan":"Gudang Timika diana","produk_nama":"Kentang","satuan_nama":"Kg","mutasi_id":45,"gudang_asal_id":2,"gudang_tujuan_id":3,"produk_id":77,"qty":500,"satuan_id":2,"tanggal":"2021-09-05T17:00:00.000Z"},{"gudang_asal":"Gudang Pusat","gudang_tujuan":"Gudang Timika diana","produk_nama":"Kentang","satuan_nama":"Kg","mutasi_id":46,"gudang_asal_id":2,"gudang_tujuan_id":3,"produk_id":77,"qty":500,"satuan_id":2,"tanggal":"2021-09-05T17:00:00.000Z"},{"gudang_asal":"Gudang Pusat","gudang_tujuan":"Gudang Timika diana","produk_nama":"Kentang","satuan_nama":"Kg","mutasi_id":47,"gudang_asal_id":2,"gudang_tujuan_id":3,"produk_id":77,"qty":500,"satuan_id":2,"tanggal":"2021-09-05T17:00:00.000Z"},{"gudang_asal":"Gudang Pusat","gudang_tujuan":"Gudang Timika diana","produk_nama":"Kentang","satuan_nama":"Kg","mutasi_id":48,"gudang_asal_id":2,"gudang_tujuan_id":3,"produk_id":77,"qty":500,"satuan_id":2,"tanggal":"2021-09-05T17:00:00.000Z"}]}

class ModelListWarehouseMut {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelListWarehouseMut({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelListWarehouseMut.fromJson(dynamic json) {
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

/// array_list : [{"gudang_asal":"Gudang Pusat","gudang_tujuan":"Gudang Timika diana","produk_nama":"Kentang","satuan_nama":"Kg","mutasi_id":45,"gudang_asal_id":2,"gudang_tujuan_id":3,"produk_id":77,"qty":500,"satuan_id":2,"tanggal":"2021-09-05T17:00:00.000Z"},{"gudang_asal":"Gudang Pusat","gudang_tujuan":"Gudang Timika diana","produk_nama":"Kentang","satuan_nama":"Kg","mutasi_id":46,"gudang_asal_id":2,"gudang_tujuan_id":3,"produk_id":77,"qty":500,"satuan_id":2,"tanggal":"2021-09-05T17:00:00.000Z"},{"gudang_asal":"Gudang Pusat","gudang_tujuan":"Gudang Timika diana","produk_nama":"Kentang","satuan_nama":"Kg","mutasi_id":47,"gudang_asal_id":2,"gudang_tujuan_id":3,"produk_id":77,"qty":500,"satuan_id":2,"tanggal":"2021-09-05T17:00:00.000Z"},{"gudang_asal":"Gudang Pusat","gudang_tujuan":"Gudang Timika diana","produk_nama":"Kentang","satuan_nama":"Kg","mutasi_id":48,"gudang_asal_id":2,"gudang_tujuan_id":3,"produk_id":77,"qty":500,"satuan_id":2,"tanggal":"2021-09-05T17:00:00.000Z"}]

class Data {
  List<Array_list>? _arrayList;

  List<Array_list>? get arrayList => _arrayList;

  Data({
      List<Array_list>? arrayList}){
    _arrayList = arrayList;
}

  Data.fromJson(dynamic json) {
    if (json["array_list"] != null) {
      _arrayList = [];
      json["array_list"].forEach((v) {
        _arrayList?.add(Array_list.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayList != null) {
      map["array_list"] = _arrayList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// gudang_asal : "Gudang Pusat"
/// gudang_tujuan : "Gudang Timika diana"
/// produk_nama : "Kentang"
/// satuan_nama : "Kg"
/// mutasi_id : 45
/// gudang_asal_id : 2
/// gudang_tujuan_id : 3
/// produk_id : 77
/// qty : 500
/// satuan_id : 2
/// tanggal : "2021-09-05T17:00:00.000Z"

class Array_list {
  String? _gudangAsal;
  String? _gudangTujuan;
  String? _produkNama;
  String? _satuanNama;
  int? _mutasiId;
  int? _gudangAsalId;
  int? _gudangTujuanId;
  int? _produkId;
  int? _qty;
  int? _satuanId;
  String? _tanggal;

  String? get gudangAsal => _gudangAsal;
  String? get gudangTujuan => _gudangTujuan;
  String? get produkNama => _produkNama;
  String? get satuanNama => _satuanNama;
  int? get mutasiId => _mutasiId;
  int? get gudangAsalId => _gudangAsalId;
  int? get gudangTujuanId => _gudangTujuanId;
  int? get produkId => _produkId;
  int? get qty => _qty;
  int? get satuanId => _satuanId;
  String? get tanggal => _tanggal;

  Array_list({
      String? gudangAsal, 
      String? gudangTujuan, 
      String? produkNama, 
      String? satuanNama, 
      int? mutasiId, 
      int? gudangAsalId, 
      int? gudangTujuanId, 
      int? produkId, 
      int? qty, 
      int? satuanId, 
      String? tanggal}){
    _gudangAsal = gudangAsal;
    _gudangTujuan = gudangTujuan;
    _produkNama = produkNama;
    _satuanNama = satuanNama;
    _mutasiId = mutasiId;
    _gudangAsalId = gudangAsalId;
    _gudangTujuanId = gudangTujuanId;
    _produkId = produkId;
    _qty = qty;
    _satuanId = satuanId;
    _tanggal = tanggal;
}

  Array_list.fromJson(dynamic json) {
    _gudangAsal = json["gudang_asal"];
    _gudangTujuan = json["gudang_tujuan"];
    _produkNama = json["produk_nama"];
    _satuanNama = json["satuan_nama"];
    _mutasiId = json["mutasi_id"];
    _gudangAsalId = json["gudang_asal_id"];
    _gudangTujuanId = json["gudang_tujuan_id"];
    _produkId = json["produk_id"];
    _qty = json["qty"];
    _satuanId = json["satuan_id"];
    _tanggal = json["tanggal"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["gudang_asal"] = _gudangAsal;
    map["gudang_tujuan"] = _gudangTujuan;
    map["produk_nama"] = _produkNama;
    map["satuan_nama"] = _satuanNama;
    map["mutasi_id"] = _mutasiId;
    map["gudang_asal_id"] = _gudangAsalId;
    map["gudang_tujuan_id"] = _gudangTujuanId;
    map["produk_id"] = _produkId;
    map["qty"] = _qty;
    map["satuan_id"] = _satuanId;
    map["tanggal"] = _tanggal;
    return map;
  }

}