/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"array_meja":[{"meja_id":1,"meja_nomor":"A1"}],"array_sales_group":[{"sales_group_id":7,"group_id":"3","sales_group_nama":"Makanan","sales_group_desc":"","aktif_st":"1","group_nama":"Cafe dan Resto","activeColor":false},{"sales_group_id":8,"group_id":"3","sales_group_nama":"Minuman","sales_group_desc":"","aktif_st":"1","group_nama":"Cafe dan Resto","activeColor":false}],"array_produk_favorite":[{"produk_id":83,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":8,"produk_nama":"Es Jeruk","produk_harga":20000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"aktif_st":"1","ranking":1,"satuan_id":null,"group_id":"3","sales_group_nama":"Minuman","sales_group_desc":""},{"produk_id":79,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":7,"produk_nama":"Nasi Goreng","produk_harga":40000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"aktif_st":"1","ranking":5,"satuan_id":null,"group_id":"3","sales_group_nama":"Makanan","sales_group_desc":""}],"array_produk":[{"produk_id":79,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":7,"produk_nama":"Nasi Goreng","produk_harga":40000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"aktif_st":"1","ranking":5,"satuan_id":null,"group_id":"3","sales_group_nama":"Makanan","sales_group_desc":""},{"produk_id":83,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":8,"produk_nama":"Es Jeruk","produk_harga":20000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"aktif_st":"1","ranking":1,"satuan_id":null,"group_id":"3","sales_group_nama":"Minuman","sales_group_desc":""}]}

class ModelIndexWaiters {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelIndexWaiters({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelIndexWaiters.fromJson(dynamic json) {
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

/// array_meja : [{"meja_id":1,"meja_nomor":"A1"}]
/// array_sales_group : [{"sales_group_id":7,"group_id":"3","sales_group_nama":"Makanan","sales_group_desc":"","aktif_st":"1","group_nama":"Cafe dan Resto","activeColor":false},{"sales_group_id":8,"group_id":"3","sales_group_nama":"Minuman","sales_group_desc":"","aktif_st":"1","group_nama":"Cafe dan Resto","activeColor":false}]
/// array_produk_favorite : [{"produk_id":83,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":8,"produk_nama":"Es Jeruk","produk_harga":20000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"aktif_st":"1","ranking":1,"satuan_id":null,"group_id":"3","sales_group_nama":"Minuman","sales_group_desc":""},{"produk_id":79,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":7,"produk_nama":"Nasi Goreng","produk_harga":40000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"aktif_st":"1","ranking":5,"satuan_id":null,"group_id":"3","sales_group_nama":"Makanan","sales_group_desc":""}]
/// array_produk : [{"produk_id":79,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":7,"produk_nama":"Nasi Goreng","produk_harga":40000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"aktif_st":"1","ranking":5,"satuan_id":null,"group_id":"3","sales_group_nama":"Makanan","sales_group_desc":""},{"produk_id":83,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":8,"produk_nama":"Es Jeruk","produk_harga":20000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"aktif_st":"1","ranking":1,"satuan_id":null,"group_id":"3","sales_group_nama":"Minuman","sales_group_desc":""}]

class Data {
  List<Array_meja>? _arrayMeja;
  List<Array_sales_group>? _arraySalesGroup;
  List<Array_produk_favorite>? _arrayProdukFavorite;
  List<Array_produk>? _arrayProduk;

  List<Array_meja>? get arrayMeja => _arrayMeja;
  List<Array_sales_group>? get arraySalesGroup => _arraySalesGroup;
  List<Array_produk_favorite>? get arrayProdukFavorite => _arrayProdukFavorite;
  List<Array_produk>? get arrayProduk => _arrayProduk;

  Data({
      List<Array_meja>? arrayMeja, 
      List<Array_sales_group>? arraySalesGroup, 
      List<Array_produk_favorite>? arrayProdukFavorite, 
      List<Array_produk>? arrayProduk}){
    _arrayMeja = arrayMeja;
    _arraySalesGroup = arraySalesGroup;
    _arrayProdukFavorite = arrayProdukFavorite;
    _arrayProduk = arrayProduk;
}

  Data.fromJson(dynamic json) {
    if (json["array_meja"] != null) {
      _arrayMeja = [];
      json["array_meja"].forEach((v) {
        _arrayMeja?.add(Array_meja.fromJson(v));
      });
    }
    if (json["array_sales_group"] != null) {
      _arraySalesGroup = [];
      json["array_sales_group"].forEach((v) {
        _arraySalesGroup?.add(Array_sales_group.fromJson(v));
      });
    }
    if (json["array_produk_favorite"] != null) {
      _arrayProdukFavorite = [];
      json["array_produk_favorite"].forEach((v) {
        _arrayProdukFavorite?.add(Array_produk_favorite.fromJson(v));
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
    if (_arrayMeja != null) {
      map["array_meja"] = _arrayMeja?.map((v) => v.toJson()).toList();
    }
    if (_arraySalesGroup != null) {
      map["array_sales_group"] = _arraySalesGroup?.map((v) => v.toJson()).toList();
    }
    if (_arrayProdukFavorite != null) {
      map["array_produk_favorite"] = _arrayProdukFavorite?.map((v) => v.toJson()).toList();
    }
    if (_arrayProduk != null) {
      map["array_produk"] = _arrayProduk?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// produk_id : 79
/// produk_group_id : 2
/// sub_produk_group_id : null
/// kitchen_id : 1
/// sales_group_id : 7
/// produk_nama : "Nasi Goreng"
/// produk_harga : 40000
/// produk_gambar_nama : "hdPGT6YTFB-1630756076109.jpg"
/// produk_gambar_path : "/doc/produk_img/"
/// stok : 0
/// aktif_st : "1"
/// ranking : 5
/// satuan_id : null
/// group_id : "3"
/// sales_group_nama : "Makanan"
/// sales_group_desc : ""

class Array_produk {
  int? _produkId;
  int? _produkGroupId;
  dynamic? _subProdukGroupId;
  int? _kitchenId;
  int? _salesGroupId;
  String? _produkNama;
  int? _produkHarga;
  String? _produkGambarNama;
  String? _produkGambarPath;
  int? _stok;
  String? _aktifSt;
  int? _ranking;
  dynamic? _satuanId;
  String? _groupId;
  String? _salesGroupNama;
  String? _salesGroupDesc;

  int? get produkId => _produkId;
  int? get produkGroupId => _produkGroupId;
  dynamic? get subProdukGroupId => _subProdukGroupId;
  int? get kitchenId => _kitchenId;
  int? get salesGroupId => _salesGroupId;
  String? get produkNama => _produkNama;
  int? get produkHarga => _produkHarga;
  String? get produkGambarNama => _produkGambarNama;
  String? get produkGambarPath => _produkGambarPath;
  int? get stok => _stok;
  String? get aktifSt => _aktifSt;
  int? get ranking => _ranking;
  dynamic? get satuanId => _satuanId;
  String? get groupId => _groupId;
  String? get salesGroupNama => _salesGroupNama;
  String? get salesGroupDesc => _salesGroupDesc;

  Array_produk({
      int? produkId, 
      int? produkGroupId, 
      dynamic? subProdukGroupId, 
      int? kitchenId, 
      int? salesGroupId, 
      String? produkNama, 
      int? produkHarga, 
      String? produkGambarNama, 
      String? produkGambarPath, 
      int? stok, 
      String? aktifSt, 
      int? ranking, 
      dynamic? satuanId, 
      String? groupId, 
      String? salesGroupNama, 
      String? salesGroupDesc}){
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
    _groupId = groupId;
    _salesGroupNama = salesGroupNama;
    _salesGroupDesc = salesGroupDesc;
}

  Array_produk.fromJson(dynamic json) {
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
    _groupId = json["group_id"];
    _salesGroupNama = json["sales_group_nama"];
    _salesGroupDesc = json["sales_group_desc"];
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
    map["group_id"] = _groupId;
    map["sales_group_nama"] = _salesGroupNama;
    map["sales_group_desc"] = _salesGroupDesc;
    return map;
  }

}

/// produk_id : 83
/// produk_group_id : 2
/// sub_produk_group_id : null
/// kitchen_id : 1
/// sales_group_id : 8
/// produk_nama : "Es Jeruk"
/// produk_harga : 20000
/// produk_gambar_nama : "hdPGT6YTFB-1630756076109.jpg"
/// produk_gambar_path : "/doc/produk_img/"
/// stok : 0
/// aktif_st : "1"
/// ranking : 1
/// satuan_id : null
/// group_id : "3"
/// sales_group_nama : "Minuman"
/// sales_group_desc : ""

class Array_produk_favorite {
  int? _produkId;
  int? _produkGroupId;
  dynamic? _subProdukGroupId;
  int? _kitchenId;
  int? _salesGroupId;
  String? _produkNama;
  int? _produkHarga;
  String? _produkGambarNama;
  String? _produkGambarPath;
  int? _stok;
  String? _aktifSt;
  int? _ranking;
  dynamic? _satuanId;
  String? _groupId;
  String? _salesGroupNama;
  String? _salesGroupDesc;

  int? get produkId => _produkId;
  int? get produkGroupId => _produkGroupId;
  dynamic? get subProdukGroupId => _subProdukGroupId;
  int? get kitchenId => _kitchenId;
  int? get salesGroupId => _salesGroupId;
  String? get produkNama => _produkNama;
  int? get produkHarga => _produkHarga;
  String? get produkGambarNama => _produkGambarNama;
  String? get produkGambarPath => _produkGambarPath;
  int? get stok => _stok;
  String? get aktifSt => _aktifSt;
  int? get ranking => _ranking;
  dynamic? get satuanId => _satuanId;
  String? get groupId => _groupId;
  String? get salesGroupNama => _salesGroupNama;
  String? get salesGroupDesc => _salesGroupDesc;

  Array_produk_favorite({
      int? produkId, 
      int? produkGroupId, 
      dynamic? subProdukGroupId, 
      int? kitchenId, 
      int? salesGroupId, 
      String? produkNama, 
      int? produkHarga, 
      String? produkGambarNama, 
      String? produkGambarPath, 
      int? stok, 
      String? aktifSt, 
      int? ranking, 
      dynamic? satuanId, 
      String? groupId, 
      String? salesGroupNama, 
      String? salesGroupDesc}){
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
    _groupId = groupId;
    _salesGroupNama = salesGroupNama;
    _salesGroupDesc = salesGroupDesc;
}

  Array_produk_favorite.fromJson(dynamic json) {
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
    _groupId = json["group_id"];
    _salesGroupNama = json["sales_group_nama"];
    _salesGroupDesc = json["sales_group_desc"];
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
    map["group_id"] = _groupId;
    map["sales_group_nama"] = _salesGroupNama;
    map["sales_group_desc"] = _salesGroupDesc;
    return map;
  }

}

/// sales_group_id : 7
/// group_id : "3"
/// sales_group_nama : "Makanan"
/// sales_group_desc : ""
/// aktif_st : "1"
/// group_nama : "Cafe dan Resto"
/// activeColor : false

class Array_sales_group {
  int? _salesGroupId;
  String? _groupId;
  String? _salesGroupNama;
  String? _salesGroupDesc;
  String? _aktifSt;
  String? _groupNama;
  bool? _activeColor;

  int? get salesGroupId => _salesGroupId;
  String? get groupId => _groupId;
  String? get salesGroupNama => _salesGroupNama;
  String? get salesGroupDesc => _salesGroupDesc;
  String? get aktifSt => _aktifSt;
  String? get groupNama => _groupNama;
  bool? get activeColor => _activeColor;


  set activeColor(bool? value) {
    _activeColor = value;
  }

  Array_sales_group({
      int? salesGroupId, 
      String? groupId, 
      String? salesGroupNama, 
      String? salesGroupDesc, 
      String? aktifSt, 
      String? groupNama, 
      bool? activeColor}){
    _salesGroupId = salesGroupId;
    _groupId = groupId;
    _salesGroupNama = salesGroupNama;
    _salesGroupDesc = salesGroupDesc;
    _aktifSt = aktifSt;
    _groupNama = groupNama;
    _activeColor = activeColor;
}

  Array_sales_group.fromJson(dynamic json) {
    _salesGroupId = json["sales_group_id"];
    _groupId = json["group_id"];
    _salesGroupNama = json["sales_group_nama"];
    _salesGroupDesc = json["sales_group_desc"];
    _aktifSt = json["aktif_st"];
    _groupNama = json["group_nama"];
    _activeColor = json["activeColor"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["sales_group_id"] = _salesGroupId;
    map["group_id"] = _groupId;
    map["sales_group_nama"] = _salesGroupNama;
    map["sales_group_desc"] = _salesGroupDesc;
    map["aktif_st"] = _aktifSt;
    map["group_nama"] = _groupNama;
    map["activeColor"] = _activeColor;
    return map;
  }

}

/// meja_id : 1
/// meja_nomor : "A1"

class Array_meja {
  int? _mejaId;
  String? _mejaNomor;

  int? get mejaId => _mejaId;
  String? get mejaNomor => _mejaNomor;

  Array_meja({
      int? mejaId, 
      String? mejaNomor}){
    _mejaId = mejaId;
    _mejaNomor = mejaNomor;
}

  Array_meja.fromJson(dynamic json) {
    _mejaId = json["meja_id"];
    _mejaNomor = json["meja_nomor"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["meja_id"] = _mejaId;
    map["meja_nomor"] = _mejaNomor;
    return map;
  }

}