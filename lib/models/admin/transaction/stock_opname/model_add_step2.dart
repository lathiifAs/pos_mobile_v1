/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"array_produk":[{"stok_gudang_id":8,"gudang_id":3,"produk_id":77,"stok":500,"satuan_id":2,"produk_nama":"Kentang","satuan_nama":"Kg"},{"stok_gudang_id":11,"gudang_id":3,"produk_id":78,"stok":3,"satuan_id":1,"produk_nama":"beras","satuan_nama":"Ton"},{"stok_gudang_id":29,"gudang_id":3,"produk_id":84,"stok":0,"satuan_id":3,"produk_nama":"Bolu kukus","satuan_nama":"Gram"},{"stok_gudang_id":32,"gudang_id":3,"produk_id":85,"stok":0,"satuan_id":3,"produk_nama":"Roti Buaya","satuan_nama":"Gram"}]}

class ModelAddStep2 {
  ModelAddStep2({
    bool? notifSt,
    String? notifMsg,
    Data? data,
  }) {
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
  }

  ModelAddStep2.fromJson(dynamic json) {
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

/// array_produk : [{"stok_gudang_id":8,"gudang_id":3,"produk_id":77,"stok":500,"satuan_id":2,"produk_nama":"Kentang","satuan_nama":"Kg"},{"stok_gudang_id":11,"gudang_id":3,"produk_id":78,"stok":3,"satuan_id":1,"produk_nama":"beras","satuan_nama":"Ton"},{"stok_gudang_id":29,"gudang_id":3,"produk_id":84,"stok":0,"satuan_id":3,"produk_nama":"Bolu kukus","satuan_nama":"Gram"},{"stok_gudang_id":32,"gudang_id":3,"produk_id":85,"stok":0,"satuan_id":3,"produk_nama":"Roti Buaya","satuan_nama":"Gram"}]

class Data {
  Data({
    List<Array_produk>? arrayProduk,
  }) {
    _arrayProduk = arrayProduk;
  }

  Data.fromJson(dynamic json) {
    if (json['array_produk'] != null) {
      _arrayProduk = [];
      json['array_produk'].forEach((v) {
        _arrayProduk?.add(Array_produk.fromJson(v));
      });
    }
  }

  List<Array_produk>? _arrayProduk;

  List<Array_produk>? get arrayProduk => _arrayProduk;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_arrayProduk != null) {
      map['array_produk'] = _arrayProduk?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// stok_gudang_id : 8
/// gudang_id : 3
/// produk_id : 77
/// stok : 500
/// satuan_id : 2
/// produk_nama : "Kentang"
/// satuan_nama : "Kg"

class Array_produk {
  Array_produk({
    int? stokGudangId,
    int? gudangId,
    int? produkId,
    int? stok,
    int? satuanId,
    String? produkNama,
    String? satuanNama,
  }) {
    _stokGudangId = stokGudangId;
    _gudangId = gudangId;
    _produkId = produkId;
    _stok = stok;
    _satuanId = satuanId;
    _produkNama = produkNama;
    _satuanNama = satuanNama;
  }

  Array_produk.fromJson(dynamic json) {
    _stokGudangId = json['stok_gudang_id'];
    _gudangId = json['gudang_id'];
    _produkId = json['produk_id'];
    _stok = json['stok'];
    _satuanId = json['satuan_id'];
    _produkNama = json['produk_nama'];
    _satuanNama = json['satuan_nama'];
  }

  int? _stokGudangId;
  int? _gudangId;
  int? _produkId;
  int? _stok;
  int? _satuanId;
  String? _produkNama;
  String? _satuanNama;

  int? get stokGudangId => _stokGudangId;

  int? get gudangId => _gudangId;

  int? get produkId => _produkId;

  int? get stok => _stok;

  int? get satuanId => _satuanId;

  String? get produkNama => _produkNama;

  String? get satuanNama => _satuanNama;

  set stok(int? value) {
    _stok = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stok_gudang_id'] = _stokGudangId;
    map['gudang_id'] = _gudangId;
    map['produk_id'] = _produkId;
    map['stok'] = _stok;
    map['satuan_id'] = _satuanId;
    map['produk_nama'] = _produkNama;
    map['satuan_nama'] = _satuanNama;
    return map;
  }
}
