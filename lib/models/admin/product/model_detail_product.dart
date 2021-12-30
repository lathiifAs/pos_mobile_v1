/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"result":{"produk_id":79,"kode_produk":null,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":7,"produk_nama":"Nasi Goreng","produk_harga":40000,"produk_gambar_nama":"nasgor.jpeg","produk_gambar_path":"/doc/produk_img/","stok":0,"aktif_st":"1","ranking":5,"satuan_id":null,"kitchen_nama":"kitchen makanan"},"array_gambar_detail":[{"produk_gambar_id":10,"produk_id":79,"gambar_path":"/doc/produk_img/","gambar_nama":"jI3EJapIHL-1630903766924.jpg"}]}

class ModelDetailProduct {
  ModelDetailProduct({
      this.notifSt, 
      this.notifMsg, 
      this.data,});

  ModelDetailProduct.fromJson(dynamic json) {
    notifSt = json['notif_st'];
    notifMsg = json['notif_msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? notifSt;
  String? notifMsg;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notif_st'] = notifSt;
    map['notif_msg'] = notifMsg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// result : {"produk_id":79,"kode_produk":null,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":7,"produk_nama":"Nasi Goreng","produk_harga":40000,"produk_gambar_nama":"nasgor.jpeg","produk_gambar_path":"/doc/produk_img/","stok":0,"aktif_st":"1","ranking":5,"satuan_id":null,"kitchen_nama":"kitchen makanan"}
/// array_gambar_detail : [{"produk_gambar_id":10,"produk_id":79,"gambar_path":"/doc/produk_img/","gambar_nama":"jI3EJapIHL-1630903766924.jpg"}]

class Data {
  Data({
      this.result, 
      this.arrayGambarDetail,});

  Data.fromJson(dynamic json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    if (json['array_gambar_detail'] != null) {
      arrayGambarDetail = [];
      json['array_gambar_detail'].forEach((v) {
        arrayGambarDetail?.add(Array_gambar_detail.fromJson(v));
      });
    }
  }
  Result? result;
  List<Array_gambar_detail>? arrayGambarDetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.toJson();
    }
    if (arrayGambarDetail != null) {
      map['array_gambar_detail'] = arrayGambarDetail?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// produk_gambar_id : 10
/// produk_id : 79
/// gambar_path : "/doc/produk_img/"
/// gambar_nama : "jI3EJapIHL-1630903766924.jpg"

class Array_gambar_detail {
  Array_gambar_detail({
      this.produkGambarId, 
      this.produkId, 
      this.gambarPath, 
      this.gambarNama,});

  Array_gambar_detail.fromJson(dynamic json) {
    produkGambarId = json['produk_gambar_id'];
    produkId = json['produk_id'];
    gambarPath = json['gambar_path'];
    gambarNama = json['gambar_nama'];
  }
  int? produkGambarId;
  int? produkId;
  String? gambarPath;
  String? gambarNama;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['produk_gambar_id'] = produkGambarId;
    map['produk_id'] = produkId;
    map['gambar_path'] = gambarPath;
    map['gambar_nama'] = gambarNama;
    return map;
  }

}

/// produk_id : 79
/// kode_produk : null
/// produk_group_id : 2
/// sub_produk_group_id : null
/// kitchen_id : 1
/// sales_group_id : 7
/// produk_nama : "Nasi Goreng"
/// produk_harga : 40000
/// produk_gambar_nama : "nasgor.jpeg"
/// produk_gambar_path : "/doc/produk_img/"
/// stok : 0
/// aktif_st : "1"
/// ranking : 5
/// satuan_id : null
/// kitchen_nama : "kitchen makanan"

class Result {
  Result({
      this.produkId, 
      this.kodeProduk, 
      this.produkGroupId, 
      this.subProdukGroupId, 
      this.kitchenId, 
      this.salesGroupId, 
      this.produkNama, 
      this.produkHarga, 
      this.produkGambarNama, 
      this.produkGambarPath, 
      this.stok, 
      this.aktifSt, 
      this.ranking, 
      this.satuanId, 
      this.kitchenNama,});

  Result.fromJson(dynamic json) {
    produkId = json['produk_id'];
    kodeProduk = json['kode_produk'];
    produkGroupId = json['produk_group_id'];
    subProdukGroupId = json['sub_produk_group_id'];
    kitchenId = json['kitchen_id'];
    salesGroupId = json['sales_group_id'];
    produkNama = json['produk_nama'];
    produkHarga = json['produk_harga'];
    produkGambarNama = json['produk_gambar_nama'];
    produkGambarPath = json['produk_gambar_path'];
    stok = json['stok'];
    aktifSt = json['aktif_st'];
    ranking = json['ranking'];
    satuanId = json['satuan_id'];
    kitchenNama = json['kitchen_nama'];
  }
  int? produkId;
  dynamic kodeProduk;
  int? produkGroupId;
  dynamic subProdukGroupId;
  int? kitchenId;
  int? salesGroupId;
  String? produkNama;
  int? produkHarga;
  String? produkGambarNama;
  String? produkGambarPath;
  int? stok;
  String? aktifSt;
  int? ranking;
  dynamic satuanId;
  String? kitchenNama;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['produk_id'] = produkId;
    map['kode_produk'] = kodeProduk;
    map['produk_group_id'] = produkGroupId;
    map['sub_produk_group_id'] = subProdukGroupId;
    map['kitchen_id'] = kitchenId;
    map['sales_group_id'] = salesGroupId;
    map['produk_nama'] = produkNama;
    map['produk_harga'] = produkHarga;
    map['produk_gambar_nama'] = produkGambarNama;
    map['produk_gambar_path'] = produkGambarPath;
    map['stok'] = stok;
    map['aktif_st'] = aktifSt;
    map['ranking'] = ranking;
    map['satuan_id'] = satuanId;
    map['kitchen_nama'] = kitchenNama;
    return map;
  }

}