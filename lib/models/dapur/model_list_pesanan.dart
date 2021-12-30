/// notif_st : true
/// notif_msg : "Successfully retrieved data."
/// data : {"result":[{"detail_transaksi_id":143,"produk_nama":"Es Jeruk","jml_beli":1,"catatan":""},{"detail_transaksi_id":144,"produk_nama":"Es Jeruk","jml_beli":1,"catatan":""},{"detail_transaksi_id":147,"produk_nama":"Es Jeruk","jml_beli":1,"catatan":""}]}

class ModelListPesanan {
  ModelListPesanan({
      this.notifSt, 
      this.notifMsg, 
      this.data,});

  ModelListPesanan.fromJson(dynamic json) {
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

/// result : [{"detail_transaksi_id":143,"produk_nama":"Es Jeruk","jml_beli":1,"catatan":""},{"detail_transaksi_id":144,"produk_nama":"Es Jeruk","jml_beli":1,"catatan":""},{"detail_transaksi_id":147,"produk_nama":"Es Jeruk","jml_beli":1,"catatan":""}]

class Data {
  Data({
      this.result,});

  Data.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Result.fromJson(v));
      });
    }
  }
  List<Result>? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// detail_transaksi_id : 143
/// produk_nama : "Es Jeruk"
/// jml_beli : 1
/// catatan : ""

class Result {
  Result({
      this.detailTransaksiId, 
      this.produkNama, 
      this.jmlBeli, 
      this.catatan,});

  Result.fromJson(dynamic json) {
    detailTransaksiId = json['detail_transaksi_id'];
    produkNama = json['produk_nama'];
    jmlBeli = json['jml_beli'];
    catatan = json['catatan'];
  }
  int? detailTransaksiId;
  String? produkNama;
  int? jmlBeli;
  String? catatan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['detail_transaksi_id'] = detailTransaksiId;
    map['produk_nama'] = produkNama;
    map['jml_beli'] = jmlBeli;
    map['catatan'] = catatan;
    return map;
  }

}