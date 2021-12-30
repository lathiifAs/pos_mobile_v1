/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"array_sub_produk_group":[{"sub_produk_group_id":14,"produk_group_id":1,"sub_produk_group_nama":"Mentega","sub_produk_group_desc":"","aktif_st":"1","produk_group_nama":"Bahan baku"}],"array_kitchen":[{"kitchen_id":1,"kitchen_nama":"kitchen edit 1","kitchen_deskripsi":"Testing"}],"array_sales":[{"sales_group_id":7,"group_id":"3","sales_group_nama":"Makanan","sales_group_desc":"","aktif_st":"1","group_nama":"Cafe dan Resto"},{"sales_group_id":8,"group_id":"3","sales_group_nama":"Minuman","sales_group_desc":"","aktif_st":"1","group_nama":"Cafe dan Resto"},{"sales_group_id":9,"group_id":"4","sales_group_nama":"Bolu","sales_group_desc":"","aktif_st":"1","group_nama":"Retail Bakery"},{"sales_group_id":10,"group_id":"4","sales_group_nama":"Brownis","sales_group_desc":"","aktif_st":"1","group_nama":"Retail Bakery"}],"array_bahan_baku":[{"produk_id":77,"produk_group_id":1,"sub_produk_group_id":14,"kitchen_id":null,"sales_group_id":null,"produk_nama":"Kentang","produk_harga":12000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":1000,"aktif_st":"1","ranking":null,"satuan_id":1,"produk_group_nama":"Bahan baku","produk_group_desc":"","retail_st":"0"}],"array_satuan":[{"satuan_id":1,"satuan_nama":"Ton"},{"satuan_id":2,"satuan_nama":"Kg"},{"satuan_id":3,"satuan_nama":"Gram"}]}

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

/// array_sub_produk_group : [{"sub_produk_group_id":14,"produk_group_id":1,"sub_produk_group_nama":"Mentega","sub_produk_group_desc":"","aktif_st":"1","produk_group_nama":"Bahan baku"}]
/// array_kitchen : [{"kitchen_id":1,"kitchen_nama":"kitchen edit 1","kitchen_deskripsi":"Testing"}]
/// array_sales : [{"sales_group_id":7,"group_id":"3","sales_group_nama":"Makanan","sales_group_desc":"","aktif_st":"1","group_nama":"Cafe dan Resto"},{"sales_group_id":8,"group_id":"3","sales_group_nama":"Minuman","sales_group_desc":"","aktif_st":"1","group_nama":"Cafe dan Resto"},{"sales_group_id":9,"group_id":"4","sales_group_nama":"Bolu","sales_group_desc":"","aktif_st":"1","group_nama":"Retail Bakery"},{"sales_group_id":10,"group_id":"4","sales_group_nama":"Brownis","sales_group_desc":"","aktif_st":"1","group_nama":"Retail Bakery"}]
/// array_bahan_baku : [{"produk_id":77,"produk_group_id":1,"sub_produk_group_id":14,"kitchen_id":null,"sales_group_id":null,"produk_nama":"Kentang","produk_harga":12000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":1000,"aktif_st":"1","ranking":null,"satuan_id":1,"produk_group_nama":"Bahan baku","produk_group_desc":"","retail_st":"0"}]
/// array_satuan : [{"satuan_id":1,"satuan_nama":"Ton"},{"satuan_id":2,"satuan_nama":"Kg"},{"satuan_id":3,"satuan_nama":"Gram"}]

class Data {
  List<Array_sub_produk_group>? _arraySubProdukGroup;
  List<Array_kitchen>? _arrayKitchen;
  List<Array_sales>? _arraySales;
  List<Array_bahan_baku>? _arrayBahanBaku;
  List<Array_satuan>? _arraySatuan;

  List<Array_sub_produk_group>? get arraySubProdukGroup => _arraySubProdukGroup;
  List<Array_kitchen>? get arrayKitchen => _arrayKitchen;
  List<Array_sales>? get arraySales => _arraySales;
  List<Array_bahan_baku>? get arrayBahanBaku => _arrayBahanBaku;
  List<Array_satuan>? get arraySatuan => _arraySatuan;

  Data({
      List<Array_sub_produk_group>? arraySubProdukGroup, 
      List<Array_kitchen>? arrayKitchen, 
      List<Array_sales>? arraySales, 
      List<Array_bahan_baku>? arrayBahanBaku, 
      List<Array_satuan>? arraySatuan}){
    _arraySubProdukGroup = arraySubProdukGroup;
    _arrayKitchen = arrayKitchen;
    _arraySales = arraySales;
    _arrayBahanBaku = arrayBahanBaku;
    _arraySatuan = arraySatuan;
}

  Data.fromJson(dynamic json) {
    if (json["array_sub_produk_group"] != null) {
      _arraySubProdukGroup = [];
      json["array_sub_produk_group"].forEach((v) {
        _arraySubProdukGroup?.add(Array_sub_produk_group.fromJson(v));
      });
    }
    if (json["array_kitchen"] != null) {
      _arrayKitchen = [];
      json["array_kitchen"].forEach((v) {
        _arrayKitchen?.add(Array_kitchen.fromJson(v));
      });
    }
    if (json["array_sales"] != null) {
      _arraySales = [];
      json["array_sales"].forEach((v) {
        _arraySales?.add(Array_sales.fromJson(v));
      });
    }
    if (json["array_bahan_baku"] != null) {
      _arrayBahanBaku = [];
      json["array_bahan_baku"].forEach((v) {
        _arrayBahanBaku?.add(Array_bahan_baku.fromJson(v));
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
    if (_arraySubProdukGroup != null) {
      map["array_sub_produk_group"] = _arraySubProdukGroup?.map((v) => v.toJson()).toList();
    }
    if (_arrayKitchen != null) {
      map["array_kitchen"] = _arrayKitchen?.map((v) => v.toJson()).toList();
    }
    if (_arraySales != null) {
      map["array_sales"] = _arraySales?.map((v) => v.toJson()).toList();
    }
    if (_arrayBahanBaku != null) {
      map["array_bahan_baku"] = _arrayBahanBaku?.map((v) => v.toJson()).toList();
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
/// stok : 1000
/// aktif_st : "1"
/// ranking : null
/// satuan_id : 1
/// produk_group_nama : "Bahan baku"
/// produk_group_desc : ""
/// retail_st : "0"

class Array_bahan_baku {
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

  Array_bahan_baku({
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

  Array_bahan_baku.fromJson(dynamic json) {
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

/// sales_group_id : 7
/// group_id : "3"
/// sales_group_nama : "Makanan"
/// sales_group_desc : ""
/// aktif_st : "1"
/// group_nama : "Cafe dan Resto"

class Array_sales {
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

  Array_sales({
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

  Array_sales.fromJson(dynamic json) {
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

/// kitchen_id : 1
/// kitchen_nama : "kitchen edit 1"
/// kitchen_deskripsi : "Testing"

class Array_kitchen {
  int? _kitchenId;
  String? _kitchenNama;
  String? _kitchenDeskripsi;

  int? get kitchenId => _kitchenId;
  String? get kitchenNama => _kitchenNama;
  String? get kitchenDeskripsi => _kitchenDeskripsi;

  Array_kitchen({
      int? kitchenId, 
      String? kitchenNama, 
      String? kitchenDeskripsi}){
    _kitchenId = kitchenId;
    _kitchenNama = kitchenNama;
    _kitchenDeskripsi = kitchenDeskripsi;
}

  Array_kitchen.fromJson(dynamic json) {
    _kitchenId = json["kitchen_id"];
    _kitchenNama = json["kitchen_nama"];
    _kitchenDeskripsi = json["kitchen_deskripsi"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["kitchen_id"] = _kitchenId;
    map["kitchen_nama"] = _kitchenNama;
    map["kitchen_deskripsi"] = _kitchenDeskripsi;
    return map;
  }

}

/// sub_produk_group_id : 14
/// produk_group_id : 1
/// sub_produk_group_nama : "Mentega"
/// sub_produk_group_desc : ""
/// aktif_st : "1"
/// produk_group_nama : "Bahan baku"

class Array_sub_produk_group {
  int? _subProdukGroupId;
  int? _produkGroupId;
  String? _subProdukGroupNama;
  String? _subProdukGroupDesc;
  String? _aktifSt;
  String? _produkGroupNama;

  int? get subProdukGroupId => _subProdukGroupId;
  int? get produkGroupId => _produkGroupId;
  String? get subProdukGroupNama => _subProdukGroupNama;
  String? get subProdukGroupDesc => _subProdukGroupDesc;
  String? get aktifSt => _aktifSt;
  String? get produkGroupNama => _produkGroupNama;

  Array_sub_produk_group({
      int? subProdukGroupId, 
      int? produkGroupId, 
      String? subProdukGroupNama, 
      String? subProdukGroupDesc, 
      String? aktifSt, 
      String? produkGroupNama}){
    _subProdukGroupId = subProdukGroupId;
    _produkGroupId = produkGroupId;
    _subProdukGroupNama = subProdukGroupNama;
    _subProdukGroupDesc = subProdukGroupDesc;
    _aktifSt = aktifSt;
    _produkGroupNama = produkGroupNama;
}

  Array_sub_produk_group.fromJson(dynamic json) {
    _subProdukGroupId = json["sub_produk_group_id"];
    _produkGroupId = json["produk_group_id"];
    _subProdukGroupNama = json["sub_produk_group_nama"];
    _subProdukGroupDesc = json["sub_produk_group_desc"];
    _aktifSt = json["aktif_st"];
    _produkGroupNama = json["produk_group_nama"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["sub_produk_group_id"] = _subProdukGroupId;
    map["produk_group_id"] = _produkGroupId;
    map["sub_produk_group_nama"] = _subProdukGroupNama;
    map["sub_produk_group_desc"] = _subProdukGroupDesc;
    map["aktif_st"] = _aktifSt;
    map["produk_group_nama"] = _produkGroupNama;
    return map;
  }

}