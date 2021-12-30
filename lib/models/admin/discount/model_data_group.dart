/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"array_sales_group":[{"sales_group_id":4,"group_id":"3","sales_group_nama":"Tes Kategori 2","sales_group_desc":"Tes","aktif_st":"1","group_nama":"Cafe dan Resto"}],"array_produk":[{"produk_id":1,"group_id":"3","role_id":5,"sales_group_id":3,"produk_nama":"Nasi Goyen","produk_harga":15000,"produk_gambar_nama":null,"produk_gambar_path":null,"stok":10,"group_nama":"Cafe dan Resto","group_desc":null}]}

class ModelDataGroup {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelDataGroup({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelDataGroup.fromJson(dynamic json) {
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

/// array_sales_group : [{"sales_group_id":4,"group_id":"3","sales_group_nama":"Tes Kategori 2","sales_group_desc":"Tes","aktif_st":"1","group_nama":"Cafe dan Resto"}]
/// array_produk : [{"produk_id":1,"group_id":"3","role_id":5,"sales_group_id":3,"produk_nama":"Nasi Goyen","produk_harga":15000,"produk_gambar_nama":null,"produk_gambar_path":null,"stok":10,"group_nama":"Cafe dan Resto","group_desc":null}]

class Data {
  List<Array_sales_group>? _arraySalesGroup;
  List<Array_produk>? _arrayProduk;

  List<Array_sales_group>? get arraySalesGroup => _arraySalesGroup;
  List<Array_produk>? get arrayProduk => _arrayProduk;

  Data({
      List<Array_sales_group>? arraySalesGroup, 
      List<Array_produk>? arrayProduk}){
    _arraySalesGroup = arraySalesGroup;
    _arrayProduk = arrayProduk;
}

  Data.fromJson(dynamic json) {
    if (json["array_sales_group"] != null) {
      _arraySalesGroup = [];
      json["array_sales_group"].forEach((v) {
        _arraySalesGroup?.add(Array_sales_group.fromJson(v));
      });
    }
    if (json["array_produk"] != null) {
      _arrayProduk = [];
      json["array_produk"].forEach((v) {
        _arrayProduk?.add(Array_produk.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arraySalesGroup != null) {
      map["array_sales_group"] = _arraySalesGroup?.map((v) => v.toJson()).toList();
    }
    if (_arrayProduk != null) {
      map["array_produk"] = _arrayProduk?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// produk_id : 1
/// group_id : "3"
/// role_id : 5
/// sales_group_id : 3
/// produk_nama : "Nasi Goyen"
/// produk_harga : 15000
/// produk_gambar_nama : null
/// produk_gambar_path : null
/// stok : 10
/// group_nama : "Cafe dan Resto"
/// group_desc : null

class Array_produk {
  int? _produkId;
  String? _groupId;
  int? _roleId;
  int? _salesGroupId;
  String? _produkNama;
  int? _produkHarga;
  dynamic? _produkGambarNama;
  dynamic? _produkGambarPath;
  int? _stok;
  String? _groupNama;
  dynamic? _groupDesc;

  int? get produkId => _produkId;
  String? get groupId => _groupId;
  int? get roleId => _roleId;
  int? get salesGroupId => _salesGroupId;
  String? get produkNama => _produkNama;
  int? get produkHarga => _produkHarga;
  dynamic? get produkGambarNama => _produkGambarNama;
  dynamic? get produkGambarPath => _produkGambarPath;
  int? get stok => _stok;
  String? get groupNama => _groupNama;
  dynamic? get groupDesc => _groupDesc;

  Array_produk({
      int? produkId, 
      String? groupId, 
      int? roleId, 
      int? salesGroupId, 
      String? produkNama, 
      int? produkHarga, 
      dynamic? produkGambarNama, 
      dynamic? produkGambarPath, 
      int? stok, 
      String? groupNama, 
      dynamic? groupDesc}){
    _produkId = produkId;
    _groupId = groupId;
    _roleId = roleId;
    _salesGroupId = salesGroupId;
    _produkNama = produkNama;
    _produkHarga = produkHarga;
    _produkGambarNama = produkGambarNama;
    _produkGambarPath = produkGambarPath;
    _stok = stok;
    _groupNama = groupNama;
    _groupDesc = groupDesc;
}

  Array_produk.fromJson(dynamic json) {
    _produkId = json["produk_id"];
    _groupId = json["group_id"];
    _roleId = json["role_id"];
    _salesGroupId = json["sales_group_id"];
    _produkNama = json["produk_nama"];
    _produkHarga = json["produk_harga"];
    _produkGambarNama = json["produk_gambar_nama"];
    _produkGambarPath = json["produk_gambar_path"];
    _stok = json["stok"];
    _groupNama = json["group_nama"];
    _groupDesc = json["group_desc"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["produk_id"] = _produkId;
    map["group_id"] = _groupId;
    map["role_id"] = _roleId;
    map["sales_group_id"] = _salesGroupId;
    map["produk_nama"] = _produkNama;
    map["produk_harga"] = _produkHarga;
    map["produk_gambar_nama"] = _produkGambarNama;
    map["produk_gambar_path"] = _produkGambarPath;
    map["stok"] = _stok;
    map["group_nama"] = _groupNama;
    map["group_desc"] = _groupDesc;
    return map;
  }

}

/// sales_group_id : 4
/// group_id : "3"
/// sales_group_nama : "Tes Kategori 2"
/// sales_group_desc : "Tes"
/// aktif_st : "1"
/// group_nama : "Cafe dan Resto"

class Array_sales_group {
  int? _salesGroupId;
  String? _groupId;
  String? _salesGroupNama;
  String? _salesGroupDesc;
  String? _aktifSt;
  String? _groupNama;

  int? get salesGroupId => _salesGroupId;
  String? get groupId => _groupId;
  String? get salesGroupNama => _salesGroupNama;
  String? get salesGroupDesc => _salesGroupDesc;
  String? get aktifSt => _aktifSt;
  String? get groupNama => _groupNama;

  Array_sales_group({
      int? salesGroupId, 
      String? groupId, 
      String? salesGroupNama, 
      String? salesGroupDesc, 
      String? aktifSt, 
      String? groupNama}){
    _salesGroupId = salesGroupId;
    _groupId = groupId;
    _salesGroupNama = salesGroupNama;
    _salesGroupDesc = salesGroupDesc;
    _aktifSt = aktifSt;
    _groupNama = groupNama;
}

  Array_sales_group.fromJson(dynamic json) {
    _salesGroupId = json["sales_group_id"];
    _groupId = json["group_id"];
    _salesGroupNama = json["sales_group_nama"];
    _salesGroupDesc = json["sales_group_desc"];
    _aktifSt = json["aktif_st"];
    _groupNama = json["group_nama"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["sales_group_id"] = _salesGroupId;
    map["group_id"] = _groupId;
    map["sales_group_nama"] = _salesGroupNama;
    map["sales_group_desc"] = _salesGroupDesc;
    map["aktif_st"] = _aktifSt;
    map["group_nama"] = _groupNama;
    return map;
  }

}