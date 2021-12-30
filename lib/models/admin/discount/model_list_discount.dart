/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : [{"array_diskon":[{"diskon_id":8,"group_id":"3","jenis_diskon":null,"diskon_nama":"Testing Diskon","diskon_desc":"Testing","syarat_sales_group_id":null,"syarat_produk_id":null,"qty_syarat":null,"free_sales_group_id":null,"free_produk_id":null,"diskon_syarat_jml_pembelian":50000,"diskon_tgl_mulai":"2021-08-26T17:00:00.000Z","diskon_tgl_exp":"2021-08-27T17:00:00.000Z","diskon_jam_mulai":"08:00:00","diskon_jam_exp":"16:00:00","diskon_presentase":15,"diskon_file":"su4f3tuqIc-1628828428526.jpg","diskon_path":"/doc/gambar_diskon/","diskon_jenis":"presentase","diskon_tanggal_exp_reformat":"20210828","tgl_mulai_reformat":"27 August 2021","tgl_exp_reformat":"28 August 2021","group_nama":"Cafe dan Resto","sales_group_nama":null,"produk_nama":null},{"diskon_id":9,"group_id":"3","jenis_diskon":null,"diskon_nama":"Discount namee","diskon_desc":"description","syarat_sales_group_id":null,"syarat_produk_id":null,"qty_syarat":null,"free_sales_group_id":null,"free_produk_id":null,"diskon_syarat_jml_pembelian":51000,"diskon_tgl_mulai":"2021-08-23T17:00:00.000Z","diskon_tgl_exp":"2021-08-24T17:00:00.000Z","diskon_jam_mulai":"08:00:00","diskon_jam_exp":"16:00:00","diskon_presentase":15,"diskon_file":"E8mZyM0gEG-1629251291942.jpg","diskon_path":"/doc/gambar_diskon/","diskon_jenis":"presentase","diskon_tanggal_exp_reformat":"20210825","tgl_mulai_reformat":"24 August 2021","tgl_exp_reformat":"25 August 2021","group_nama":"Cafe dan Resto","sales_group_nama":null,"produk_nama":null},{"diskon_id":16,"group_id":"3","jenis_diskon":null,"diskon_nama":"Testing Diskon 3","diskon_desc":"Testing","syarat_sales_group_id":4,"syarat_produk_id":1,"qty_syarat":null,"free_sales_group_id":null,"free_produk_id":null,"diskon_syarat_jml_pembelian":50000,"diskon_tgl_mulai":"2021-08-26T17:00:00.000Z","diskon_tgl_exp":"2021-08-27T17:00:00.000Z","diskon_jam_mulai":"08:00:00","diskon_jam_exp":"16:00:00","diskon_presentase":15,"diskon_file":"PXsGybvACT-1630340819423.jpg","diskon_path":"/doc/gambar_diskon/","diskon_jenis":"presentase","diskon_tanggal_exp_reformat":"20210828","tgl_mulai_reformat":"27 August 2021","tgl_exp_reformat":"28 August 2021","group_nama":"Cafe dan Resto","sales_group_nama":null,"produk_nama":null}]}]

class ModelListDiscount {
  bool? _notifSt;
  String? _notifMsg;
  List<Data>? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  List<Data>? get data => _data;

  ModelListDiscount({
      bool? notifSt, 
      String? notifMsg, 
      List<Data>? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelListDiscount.fromJson(dynamic json) {
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

/// array_diskon : [{"diskon_id":8,"group_id":"3","jenis_diskon":null,"diskon_nama":"Testing Diskon","diskon_desc":"Testing","syarat_sales_group_id":null,"syarat_produk_id":null,"qty_syarat":null,"free_sales_group_id":null,"free_produk_id":null,"diskon_syarat_jml_pembelian":50000,"diskon_tgl_mulai":"2021-08-26T17:00:00.000Z","diskon_tgl_exp":"2021-08-27T17:00:00.000Z","diskon_jam_mulai":"08:00:00","diskon_jam_exp":"16:00:00","diskon_presentase":15,"diskon_file":"su4f3tuqIc-1628828428526.jpg","diskon_path":"/doc/gambar_diskon/","diskon_jenis":"presentase","diskon_tanggal_exp_reformat":"20210828","tgl_mulai_reformat":"27 August 2021","tgl_exp_reformat":"28 August 2021","group_nama":"Cafe dan Resto","sales_group_nama":null,"produk_nama":null},{"diskon_id":9,"group_id":"3","jenis_diskon":null,"diskon_nama":"Discount namee","diskon_desc":"description","syarat_sales_group_id":null,"syarat_produk_id":null,"qty_syarat":null,"free_sales_group_id":null,"free_produk_id":null,"diskon_syarat_jml_pembelian":51000,"diskon_tgl_mulai":"2021-08-23T17:00:00.000Z","diskon_tgl_exp":"2021-08-24T17:00:00.000Z","diskon_jam_mulai":"08:00:00","diskon_jam_exp":"16:00:00","diskon_presentase":15,"diskon_file":"E8mZyM0gEG-1629251291942.jpg","diskon_path":"/doc/gambar_diskon/","diskon_jenis":"presentase","diskon_tanggal_exp_reformat":"20210825","tgl_mulai_reformat":"24 August 2021","tgl_exp_reformat":"25 August 2021","group_nama":"Cafe dan Resto","sales_group_nama":null,"produk_nama":null},{"diskon_id":16,"group_id":"3","jenis_diskon":null,"diskon_nama":"Testing Diskon 3","diskon_desc":"Testing","syarat_sales_group_id":4,"syarat_produk_id":1,"qty_syarat":null,"free_sales_group_id":null,"free_produk_id":null,"diskon_syarat_jml_pembelian":50000,"diskon_tgl_mulai":"2021-08-26T17:00:00.000Z","diskon_tgl_exp":"2021-08-27T17:00:00.000Z","diskon_jam_mulai":"08:00:00","diskon_jam_exp":"16:00:00","diskon_presentase":15,"diskon_file":"PXsGybvACT-1630340819423.jpg","diskon_path":"/doc/gambar_diskon/","diskon_jenis":"presentase","diskon_tanggal_exp_reformat":"20210828","tgl_mulai_reformat":"27 August 2021","tgl_exp_reformat":"28 August 2021","group_nama":"Cafe dan Resto","sales_group_nama":null,"produk_nama":null}]

class Data {
  List<Array_diskon>? _arrayDiskon;

  List<Array_diskon>? get arrayDiskon => _arrayDiskon;

  Data({
      List<Array_diskon>? arrayDiskon}){
    _arrayDiskon = arrayDiskon;
}

  Data.fromJson(dynamic json) {
    if (json["array_diskon"] != null) {
      _arrayDiskon = [];
      json["array_diskon"].forEach((v) {
        _arrayDiskon?.add(Array_diskon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayDiskon != null) {
      map["array_diskon"] = _arrayDiskon?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// diskon_id : 8
/// group_id : "3"
/// jenis_diskon : null
/// diskon_nama : "Testing Diskon"
/// diskon_desc : "Testing"
/// syarat_sales_group_id : null
/// syarat_produk_id : null
/// qty_syarat : null
/// free_sales_group_id : null
/// free_produk_id : null
/// diskon_syarat_jml_pembelian : 50000
/// diskon_tgl_mulai : "2021-08-26T17:00:00.000Z"
/// diskon_tgl_exp : "2021-08-27T17:00:00.000Z"
/// diskon_jam_mulai : "08:00:00"
/// diskon_jam_exp : "16:00:00"
/// diskon_presentase : 15
/// diskon_file : "su4f3tuqIc-1628828428526.jpg"
/// diskon_path : "/doc/gambar_diskon/"
/// diskon_jenis : "presentase"
/// diskon_tanggal_exp_reformat : "20210828"
/// tgl_mulai_reformat : "27 August 2021"
/// tgl_exp_reformat : "28 August 2021"
/// group_nama : "Cafe dan Resto"
/// sales_group_nama : null
/// produk_nama : null

class Array_diskon {
  int? _diskonId;
  String? _groupId;
  dynamic? _jenisDiskon;
  String? _diskonNama;
  String? _diskonDesc;
  dynamic? _syaratSalesGroupId;
  dynamic? _syaratProdukId;
  dynamic? _qtySyarat;
  dynamic? _freeSalesGroupId;
  dynamic? _freeProdukId;
  int? _diskonSyaratJmlPembelian;
  String? _diskonTglMulai;
  String? _diskonTglExp;
  String? _diskonJamMulai;
  String? _diskonJamExp;
  int? _diskonPresentase;
  String? _diskonFile;
  String? _diskonPath;
  String? _diskonJenis;
  String? _diskonTanggalExpReformat;
  String? _tglMulaiReformat;
  String? _tglExpReformat;
  String? _groupNama;
  dynamic? _salesGroupNama;
  dynamic? _produkNama;

  int? get diskonId => _diskonId;
  String? get groupId => _groupId;
  dynamic? get jenisDiskon => _jenisDiskon;
  String? get diskonNama => _diskonNama;
  String? get diskonDesc => _diskonDesc;
  dynamic? get syaratSalesGroupId => _syaratSalesGroupId;
  dynamic? get syaratProdukId => _syaratProdukId;
  dynamic? get qtySyarat => _qtySyarat;
  dynamic? get freeSalesGroupId => _freeSalesGroupId;
  dynamic? get freeProdukId => _freeProdukId;
  int? get diskonSyaratJmlPembelian => _diskonSyaratJmlPembelian;
  String? get diskonTglMulai => _diskonTglMulai;
  String? get diskonTglExp => _diskonTglExp;
  String? get diskonJamMulai => _diskonJamMulai;
  String? get diskonJamExp => _diskonJamExp;
  int? get diskonPresentase => _diskonPresentase;
  String? get diskonFile => _diskonFile;
  String? get diskonPath => _diskonPath;
  String? get diskonJenis => _diskonJenis;
  String? get diskonTanggalExpReformat => _diskonTanggalExpReformat;
  String? get tglMulaiReformat => _tglMulaiReformat;
  String? get tglExpReformat => _tglExpReformat;
  String? get groupNama => _groupNama;
  dynamic? get salesGroupNama => _salesGroupNama;
  dynamic? get produkNama => _produkNama;

  Array_diskon({
      int? diskonId, 
      String? groupId, 
      dynamic? jenisDiskon, 
      String? diskonNama, 
      String? diskonDesc, 
      dynamic? syaratSalesGroupId, 
      dynamic? syaratProdukId, 
      dynamic? qtySyarat, 
      dynamic? freeSalesGroupId, 
      dynamic? freeProdukId, 
      int? diskonSyaratJmlPembelian, 
      String? diskonTglMulai, 
      String? diskonTglExp, 
      String? diskonJamMulai, 
      String? diskonJamExp, 
      int? diskonPresentase, 
      String? diskonFile, 
      String? diskonPath, 
      String? diskonJenis, 
      String? diskonTanggalExpReformat, 
      String? tglMulaiReformat, 
      String? tglExpReformat, 
      String? groupNama, 
      dynamic? salesGroupNama, 
      dynamic? produkNama}){
    _diskonId = diskonId;
    _groupId = groupId;
    _jenisDiskon = jenisDiskon;
    _diskonNama = diskonNama;
    _diskonDesc = diskonDesc;
    _syaratSalesGroupId = syaratSalesGroupId;
    _syaratProdukId = syaratProdukId;
    _qtySyarat = qtySyarat;
    _freeSalesGroupId = freeSalesGroupId;
    _freeProdukId = freeProdukId;
    _diskonSyaratJmlPembelian = diskonSyaratJmlPembelian;
    _diskonTglMulai = diskonTglMulai;
    _diskonTglExp = diskonTglExp;
    _diskonJamMulai = diskonJamMulai;
    _diskonJamExp = diskonJamExp;
    _diskonPresentase = diskonPresentase;
    _diskonFile = diskonFile;
    _diskonPath = diskonPath;
    _diskonJenis = diskonJenis;
    _diskonTanggalExpReformat = diskonTanggalExpReformat;
    _tglMulaiReformat = tglMulaiReformat;
    _tglExpReformat = tglExpReformat;
    _groupNama = groupNama;
    _salesGroupNama = salesGroupNama;
    _produkNama = produkNama;
}

  Array_diskon.fromJson(dynamic json) {
    _diskonId = json["diskon_id"];
    _groupId = json["group_id"];
    _jenisDiskon = json["jenis_diskon"];
    _diskonNama = json["diskon_nama"];
    _diskonDesc = json["diskon_desc"];
    _syaratSalesGroupId = json["syarat_sales_group_id"];
    _syaratProdukId = json["syarat_produk_id"];
    _qtySyarat = json["qty_syarat"];
    _freeSalesGroupId = json["free_sales_group_id"];
    _freeProdukId = json["free_produk_id"];
    _diskonSyaratJmlPembelian = json["diskon_syarat_jml_pembelian"];
    _diskonTglMulai = json["diskon_tgl_mulai"];
    _diskonTglExp = json["diskon_tgl_exp"];
    _diskonJamMulai = json["diskon_jam_mulai"];
    _diskonJamExp = json["diskon_jam_exp"];
    _diskonPresentase = json["diskon_presentase"];
    _diskonFile = json["diskon_file"];
    _diskonPath = json["diskon_path"];
    _diskonJenis = json["diskon_jenis"];
    _diskonTanggalExpReformat = json["diskon_tanggal_exp_reformat"];
    _tglMulaiReformat = json["tgl_mulai_reformat"];
    _tglExpReformat = json["tgl_exp_reformat"];
    _groupNama = json["group_nama"];
    _salesGroupNama = json["sales_group_nama"];
    _produkNama = json["produk_nama"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["diskon_id"] = _diskonId;
    map["group_id"] = _groupId;
    map["jenis_diskon"] = _jenisDiskon;
    map["diskon_nama"] = _diskonNama;
    map["diskon_desc"] = _diskonDesc;
    map["syarat_sales_group_id"] = _syaratSalesGroupId;
    map["syarat_produk_id"] = _syaratProdukId;
    map["qty_syarat"] = _qtySyarat;
    map["free_sales_group_id"] = _freeSalesGroupId;
    map["free_produk_id"] = _freeProdukId;
    map["diskon_syarat_jml_pembelian"] = _diskonSyaratJmlPembelian;
    map["diskon_tgl_mulai"] = _diskonTglMulai;
    map["diskon_tgl_exp"] = _diskonTglExp;
    map["diskon_jam_mulai"] = _diskonJamMulai;
    map["diskon_jam_exp"] = _diskonJamExp;
    map["diskon_presentase"] = _diskonPresentase;
    map["diskon_file"] = _diskonFile;
    map["diskon_path"] = _diskonPath;
    map["diskon_jenis"] = _diskonJenis;
    map["diskon_tanggal_exp_reformat"] = _diskonTanggalExpReformat;
    map["tgl_mulai_reformat"] = _tglMulaiReformat;
    map["tgl_exp_reformat"] = _tglExpReformat;
    map["group_nama"] = _groupNama;
    map["sales_group_nama"] = _salesGroupNama;
    map["produk_nama"] = _produkNama;
    return map;
  }

}