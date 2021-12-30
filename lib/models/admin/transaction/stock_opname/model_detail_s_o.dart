/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"result":[{"tgl_reformat":"2021-09-25","waktu_reformat":"22:49:18","opname_id":5,"tanggal":"2021-09-25T15:49:18.000Z","keterangan":"testing","role_id":3,"role_nm":"Gudang Timika diana"}],"array_items":[{"produk_nama":"beras","satuan_nama":"Ton","stok_opname":2},{"produk_nama":"Bolu kukus","satuan_nama":"Gram","stok_opname":3},{"produk_nama":"Roti Buaya","satuan_nama":"Gram","stok_opname":10}]}

class ModelDetailSO {
  ModelDetailSO({
      bool? notifSt, 
      String? notifMsg, 
      Data? data,}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelDetailSO.fromJson(dynamic json) {
    _notifSt = json['notif_st'];
    _notifMsg = json['notif_msg'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notif_st'] = _notifSt;
    map['notif_msg'] = _notifMsg;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// result : [{"tgl_reformat":"2021-09-25","waktu_reformat":"22:49:18","opname_id":5,"tanggal":"2021-09-25T15:49:18.000Z","keterangan":"testing","role_id":3,"role_nm":"Gudang Timika diana"}]
/// array_items : [{"produk_nama":"beras","satuan_nama":"Ton","stok_opname":2},{"produk_nama":"Bolu kukus","satuan_nama":"Gram","stok_opname":3},{"produk_nama":"Roti Buaya","satuan_nama":"Gram","stok_opname":10}]

class Data {
  Data({
      List<Result>? result, 
      List<Array_items>? arrayItems,}){
    _result = result;
    _arrayItems = arrayItems;
}

  Data.fromJson(dynamic json) {
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(Result.fromJson(v));
      });
    }
    if (json['array_items'] != null) {
      _arrayItems = [];
      json['array_items'].forEach((v) {
        _arrayItems?.add(Array_items.fromJson(v));
      });
    }
  }
  List<Result>? _result;
  List<Array_items>? _arrayItems;

  List<Result>? get result => _result;
  List<Array_items>? get arrayItems => _arrayItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    if (_arrayItems != null) {
      map['array_items'] = _arrayItems?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// produk_nama : "beras"
/// satuan_nama : "Ton"
/// stok_opname : 2

class Array_items {
  Array_items({
      String? produkNama, 
      String? satuanNama, 
      int? stokOpname,}){
    _produkNama = produkNama;
    _satuanNama = satuanNama;
    _stokOpname = stokOpname;
}

  Array_items.fromJson(dynamic json) {
    _produkNama = json['produk_nama'];
    _satuanNama = json['satuan_nama'];
    _stokOpname = json['stok_opname'];
  }
  String? _produkNama;
  String? _satuanNama;
  int? _stokOpname;

  String? get produkNama => _produkNama;
  String? get satuanNama => _satuanNama;
  int? get stokOpname => _stokOpname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['produk_nama'] = _produkNama;
    map['satuan_nama'] = _satuanNama;
    map['stok_opname'] = _stokOpname;
    return map;
  }

}

/// tgl_reformat : "2021-09-25"
/// waktu_reformat : "22:49:18"
/// opname_id : 5
/// tanggal : "2021-09-25T15:49:18.000Z"
/// keterangan : "testing"
/// role_id : 3
/// role_nm : "Gudang Timika diana"

class Result {
  Result({
      String? tglReformat, 
      String? waktuReformat, 
      int? opnameId, 
      String? tanggal, 
      String? keterangan, 
      int? roleId, 
      String? roleNm,}){
    _tglReformat = tglReformat;
    _waktuReformat = waktuReformat;
    _opnameId = opnameId;
    _tanggal = tanggal;
    _keterangan = keterangan;
    _roleId = roleId;
    _roleNm = roleNm;
}

  Result.fromJson(dynamic json) {
    _tglReformat = json['tgl_reformat'];
    _waktuReformat = json['waktu_reformat'];
    _opnameId = json['opname_id'];
    _tanggal = json['tanggal'];
    _keterangan = json['keterangan'];
    _roleId = json['role_id'];
    _roleNm = json['role_nm'];
  }
  String? _tglReformat;
  String? _waktuReformat;
  int? _opnameId;
  String? _tanggal;
  String? _keterangan;
  int? _roleId;
  String? _roleNm;

  String? get tglReformat => _tglReformat;
  String? get waktuReformat => _waktuReformat;
  int? get opnameId => _opnameId;
  String? get tanggal => _tanggal;
  String? get keterangan => _keterangan;
  int? get roleId => _roleId;
  String? get roleNm => _roleNm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tgl_reformat'] = _tglReformat;
    map['waktu_reformat'] = _waktuReformat;
    map['opname_id'] = _opnameId;
    map['tanggal'] = _tanggal;
    map['keterangan'] = _keterangan;
    map['role_id'] = _roleId;
    map['role_nm'] = _roleNm;
    return map;
  }

}