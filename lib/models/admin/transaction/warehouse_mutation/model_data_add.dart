/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"array_gudang":[{"role_id":2,"group_id":"2","parent_id":"","role_nm":"Gudang Pusat","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"1","retail_st":"0"},{"role_id":3,"group_id":"2","parent_id":"","role_nm":"Gudang Timika diana","role_desc":"Testing","mdd":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"},{"role_id":4,"group_id":"2","parent_id":"","role_nm":"Gudang Timika Yos Sudarso","role_desc":null,"mdd":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"}],"array_item":[{"produk_id":77,"produk_group_id":1,"sub_produk_group_id":14,"kitchen_id":null,"sales_group_id":null,"produk_nama":"Kentang","produk_harga":12000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":501,"aktif_st":"1","ranking":null,"satuan_id":1,"produk_group_nama":"Bahan baku","produk_group_desc":"","retail_st":"0"},{"produk_id":78,"produk_group_id":1,"sub_produk_group_id":14,"kitchen_id":null,"sales_group_id":null,"produk_nama":"beras","produk_harga":60000,"produk_gambar_nama":"SKO6p8QOzc-1630883399458.jpg","produk_gambar_path":"/doc/produk_img/","stok":2,"aktif_st":"1","ranking":null,"satuan_id":1,"produk_group_nama":"Bahan baku","produk_group_desc":"","retail_st":"0"}],"array_satuan":[{"satuan_id":1,"satuan_nama":"Ton"},{"satuan_id":2,"satuan_nama":"Kg"},{"satuan_id":3,"satuan_nama":"Gram"}]}

class ModelDataAdd {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelDataAdd({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelDataAdd.fromJson(dynamic json) {
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

/// array_gudang : [{"role_id":2,"group_id":"2","parent_id":"","role_nm":"Gudang Pusat","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"1","retail_st":"0"},{"role_id":3,"group_id":"2","parent_id":"","role_nm":"Gudang Timika diana","role_desc":"Testing","mdd":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"},{"role_id":4,"group_id":"2","parent_id":"","role_nm":"Gudang Timika Yos Sudarso","role_desc":null,"mdd":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"}]
/// array_item : [{"produk_id":77,"produk_group_id":1,"sub_produk_group_id":14,"kitchen_id":null,"sales_group_id":null,"produk_nama":"Kentang","produk_harga":12000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":501,"aktif_st":"1","ranking":null,"satuan_id":1,"produk_group_nama":"Bahan baku","produk_group_desc":"","retail_st":"0"},{"produk_id":78,"produk_group_id":1,"sub_produk_group_id":14,"kitchen_id":null,"sales_group_id":null,"produk_nama":"beras","produk_harga":60000,"produk_gambar_nama":"SKO6p8QOzc-1630883399458.jpg","produk_gambar_path":"/doc/produk_img/","stok":2,"aktif_st":"1","ranking":null,"satuan_id":1,"produk_group_nama":"Bahan baku","produk_group_desc":"","retail_st":"0"}]
/// array_satuan : [{"satuan_id":1,"satuan_nama":"Ton"},{"satuan_id":2,"satuan_nama":"Kg"},{"satuan_id":3,"satuan_nama":"Gram"}]

class Data {
  List<Array_gudang>? _arrayGudang;
  List<Array_item>? _arrayItem;
  List<Array_satuan>? _arraySatuan;

  List<Array_gudang>? get arrayGudang => _arrayGudang;
  List<Array_item>? get arrayItem => _arrayItem;
  List<Array_satuan>? get arraySatuan => _arraySatuan;

  Data({
      List<Array_gudang>? arrayGudang, 
      List<Array_item>? arrayItem, 
      List<Array_satuan>? arraySatuan}){
    _arrayGudang = arrayGudang;
    _arrayItem = arrayItem;
    _arraySatuan = arraySatuan;
}

  Data.fromJson(dynamic json) {
    if (json["array_gudang"] != null) {
      _arrayGudang = [];
      json["array_gudang"].forEach((v) {
        _arrayGudang?.add(Array_gudang.fromJson(v));
      });
    }
    if (json["array_item"] != null) {
      _arrayItem = [];
      json["array_item"].forEach((v) {
        _arrayItem?.add(Array_item.fromJson(v));
      });
    }
    if (json["array_satuan"] != null) {
      _arraySatuan = [];
      json["array_satuan"].forEach((v) {
        _arraySatuan?.add(Array_satuan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayGudang != null) {
      map["array_gudang"] = _arrayGudang?.map((v) => v.toJson()).toList();
    }
    if (_arrayItem != null) {
      map["array_item"] = _arrayItem?.map((v) => v.toJson()).toList();
    }
    if (_arraySatuan != null) {
      map["array_satuan"] = _arraySatuan?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// satuan_id : 1
/// satuan_nama : "Ton"

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

/// produk_id : 77
/// produk_group_id : 1
/// sub_produk_group_id : 14
/// kitchen_id : null
/// sales_group_id : null
/// produk_nama : "Kentang"
/// produk_harga : 12000
/// produk_gambar_nama : "hdPGT6YTFB-1630756076109.jpg"
/// produk_gambar_path : "/doc/produk_img/"
/// stok : 501
/// aktif_st : "1"
/// ranking : null
/// satuan_id : 1
/// produk_group_nama : "Bahan baku"
/// produk_group_desc : ""
/// retail_st : "0"

class Array_item {
  int? _produkId;
  int? _produkGroupId;
  int? _subProdukGroupId;
  dynamic? _kitchenId;
  dynamic? _salesGroupId;
  String? _produkNama;
  int? _produkHarga;
  String? _produkGambarNama;
  String? _produkGambarPath;
  int? _stok;
  String? _aktifSt;
  dynamic? _ranking;
  int? _satuanId;
  String? _produkGroupNama;
  String? _produkGroupDesc;
  String? _retailSt;

  int? get produkId => _produkId;
  int? get produkGroupId => _produkGroupId;
  int? get subProdukGroupId => _subProdukGroupId;
  dynamic? get kitchenId => _kitchenId;
  dynamic? get salesGroupId => _salesGroupId;
  String? get produkNama => _produkNama;
  int? get produkHarga => _produkHarga;
  String? get produkGambarNama => _produkGambarNama;
  String? get produkGambarPath => _produkGambarPath;
  int? get stok => _stok;
  String? get aktifSt => _aktifSt;
  dynamic? get ranking => _ranking;
  int? get satuanId => _satuanId;
  String? get produkGroupNama => _produkGroupNama;
  String? get produkGroupDesc => _produkGroupDesc;
  String? get retailSt => _retailSt;

  Array_item({
      int? produkId, 
      int? produkGroupId, 
      int? subProdukGroupId, 
      dynamic? kitchenId, 
      dynamic? salesGroupId, 
      String? produkNama, 
      int? produkHarga, 
      String? produkGambarNama, 
      String? produkGambarPath, 
      int? stok, 
      String? aktifSt, 
      dynamic? ranking, 
      int? satuanId, 
      String? produkGroupNama, 
      String? produkGroupDesc, 
      String? retailSt}){
    _produkId = produkId;
    _produkGroupId = produkGroupId;
    _subProdukGroupId = subProdukGroupId;
    _kitchenId = kitchenId;
    _salesGroupId = salesGroupId;
    _produkNama = produkNama;
    _produkHarga = produkHarga;
    _produkGambarNama = produkGambarNama;
    _produkGambarPath = produkGambarPath;
    _stok = stok;
    _aktifSt = aktifSt;
    _ranking = ranking;
    _satuanId = satuanId;
    _produkGroupNama = produkGroupNama;
    _produkGroupDesc = produkGroupDesc;
    _retailSt = retailSt;
}

  Array_item.fromJson(dynamic json) {
    _produkId = json["produk_id"];
    _produkGroupId = json["produk_group_id"];
    _subProdukGroupId = json["sub_produk_group_id"];
    _kitchenId = json["kitchen_id"];
    _salesGroupId = json["sales_group_id"];
    _produkNama = json["produk_nama"];
    _produkHarga = json["produk_harga"];
    _produkGambarNama = json["produk_gambar_nama"];
    _produkGambarPath = json["produk_gambar_path"];
    _stok = json["stok"];
    _aktifSt = json["aktif_st"];
    _ranking = json["ranking"];
    _satuanId = json["satuan_id"];
    _produkGroupNama = json["produk_group_nama"];
    _produkGroupDesc = json["produk_group_desc"];
    _retailSt = json["retail_st"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["produk_id"] = _produkId;
    map["produk_group_id"] = _produkGroupId;
    map["sub_produk_group_id"] = _subProdukGroupId;
    map["kitchen_id"] = _kitchenId;
    map["sales_group_id"] = _salesGroupId;
    map["produk_nama"] = _produkNama;
    map["produk_harga"] = _produkHarga;
    map["produk_gambar_nama"] = _produkGambarNama;
    map["produk_gambar_path"] = _produkGambarPath;
    map["stok"] = _stok;
    map["aktif_st"] = _aktifSt;
    map["ranking"] = _ranking;
    map["satuan_id"] = _satuanId;
    map["produk_group_nama"] = _produkGroupNama;
    map["produk_group_desc"] = _produkGroupDesc;
    map["retail_st"] = _retailSt;
    return map;
  }

}

/// role_id : 2
/// group_id : "2"
/// parent_id : ""
/// role_nm : "Gudang Pusat"
/// role_desc : null
/// mdd : null
/// aktif_st : "1"
/// default_gudang : "1"
/// retail_st : "0"

class Array_gudang {
  int? _roleId;
  String? _groupId;
  String? _parentId;
  String? _roleNm;
  dynamic? _roleDesc;
  dynamic? _mdd;
  String? _aktifSt;
  String? _defaultGudang;
  String? _retailSt;

  int? get roleId => _roleId;
  String? get groupId => _groupId;
  String? get parentId => _parentId;
  String? get roleNm => _roleNm;
  dynamic? get roleDesc => _roleDesc;
  dynamic? get mdd => _mdd;
  String? get aktifSt => _aktifSt;
  String? get defaultGudang => _defaultGudang;
  String? get retailSt => _retailSt;

  Array_gudang({
      int? roleId, 
      String? groupId, 
      String? parentId, 
      String? roleNm, 
      dynamic? roleDesc, 
      dynamic? mdd, 
      String? aktifSt, 
      String? defaultGudang, 
      String? retailSt}){
    _roleId = roleId;
    _groupId = groupId;
    _parentId = parentId;
    _roleNm = roleNm;
    _roleDesc = roleDesc;
    _mdd = mdd;
    _aktifSt = aktifSt;
    _defaultGudang = defaultGudang;
    _retailSt = retailSt;
}

  Array_gudang.fromJson(dynamic json) {
    _roleId = json["role_id"];
    _groupId = json["group_id"];
    _parentId = json["parent_id"];
    _roleNm = json["role_nm"];
    _roleDesc = json["role_desc"];
    _mdd = json["mdd"];
    _aktifSt = json["aktif_st"];
    _defaultGudang = json["default_gudang"];
    _retailSt = json["retail_st"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["role_id"] = _roleId;
    map["group_id"] = _groupId;
    map["parent_id"] = _parentId;
    map["role_nm"] = _roleNm;
    map["role_desc"] = _roleDesc;
    map["mdd"] = _mdd;
    map["aktif_st"] = _aktifSt;
    map["default_gudang"] = _defaultGudang;
    map["retail_st"] = _retailSt;
    return map;
  }

}