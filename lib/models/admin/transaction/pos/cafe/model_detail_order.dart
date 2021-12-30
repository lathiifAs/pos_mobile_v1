/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"data_pemesan":[{"jenis_order":"makan_ditempat","transaksi_id":57,"nama_pemesan":"","meja_nomor":"A1","total":100000}],"list_item":[{"produk_nama":"Es Jeruk","detail_transaksi_id":81,"transaksi_id":57,"produk_id":83,"jml_beli":1,"harga":20000,"sub_total_produk":20000,"catatan":"tes"},{"produk_nama":"Nasi Goreng","detail_transaksi_id":82,"transaksi_id":57,"produk_id":79,"jml_beli":2,"harga":40000,"sub_total_produk":80000,"catatan":"tes"}]}

class ModelDetailOrder {
  ModelDetailOrder({
      bool? notifSt, 
      String? notifMsg, 
      Data? data,}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelDetailOrder.fromJson(dynamic json) {
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

/// data_pemesan : [{"jenis_order":"makan_ditempat","transaksi_id":57,"nama_pemesan":"","meja_nomor":"A1","total":100000}]
/// list_item : [{"produk_nama":"Es Jeruk","detail_transaksi_id":81,"transaksi_id":57,"produk_id":83,"jml_beli":1,"harga":20000,"sub_total_produk":20000,"catatan":"tes"},{"produk_nama":"Nasi Goreng","detail_transaksi_id":82,"transaksi_id":57,"produk_id":79,"jml_beli":2,"harga":40000,"sub_total_produk":80000,"catatan":"tes"}]

class Data {
  Data({
      List<Data_pemesan>? dataPemesan, 
      List<List_item>? listItem,}){
    _dataPemesan = dataPemesan;
    _listItem = listItem;
}

  Data.fromJson(dynamic json) {
    if (json['data_pemesan'] != null) {
      _dataPemesan = [];
      json['data_pemesan'].forEach((v) {
        _dataPemesan?.add(Data_pemesan.fromJson(v));
      });
    }
    if (json['list_item'] != null) {
      _listItem = [];
      json['list_item'].forEach((v) {
        _listItem?.add(List_item.fromJson(v));
      });
    }
  }
  List<Data_pemesan>? _dataPemesan;
  List<List_item>? _listItem;

  List<Data_pemesan>? get dataPemesan => _dataPemesan;
  List<List_item>? get listItem => _listItem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dataPemesan != null) {
      map['data_pemesan'] = _dataPemesan?.map((v) => v.toJson()).toList();
    }
    if (_listItem != null) {
      map['list_item'] = _listItem?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// produk_nama : "Es Jeruk"
/// detail_transaksi_id : 81
/// transaksi_id : 57
/// produk_id : 83
/// jml_beli : 1
/// harga : 20000
/// sub_total_produk : 20000
/// catatan : "tes"

class List_item {
  List_item({
      String? produkNama, 
      int? detailTransaksiId, 
      int? transaksiId, 
      int? produkId, 
      int? jmlBeli, 
      int? harga, 
      int? subTotalProduk, 
      String? catatan,}){
    _produkNama = produkNama;
    _detailTransaksiId = detailTransaksiId;
    _transaksiId = transaksiId;
    _produkId = produkId;
    _jmlBeli = jmlBeli;
    _harga = harga;
    _subTotalProduk = subTotalProduk;
    _catatan = catatan;
}

  List_item.fromJson(dynamic json) {
    _produkNama = json['produk_nama'];
    _detailTransaksiId = json['detail_transaksi_id'];
    _transaksiId = json['transaksi_id'];
    _produkId = json['produk_id'];
    _jmlBeli = json['jml_beli'];
    _harga = json['harga'];
    _subTotalProduk = json['sub_total_produk'];
    _catatan = json['catatan'];
  }
  String? _produkNama;
  int? _detailTransaksiId;
  int? _transaksiId;
  int? _produkId;
  int? _jmlBeli;
  int? _harga;
  int? _subTotalProduk;
  String? _catatan;

  String? get produkNama => _produkNama;
  int? get detailTransaksiId => _detailTransaksiId;
  int? get transaksiId => _transaksiId;
  int? get produkId => _produkId;
  int? get jmlBeli => _jmlBeli;
  int? get harga => _harga;
  int? get subTotalProduk => _subTotalProduk;
  String? get catatan => _catatan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['produk_nama'] = _produkNama;
    map['detail_transaksi_id'] = _detailTransaksiId;
    map['transaksi_id'] = _transaksiId;
    map['produk_id'] = _produkId;
    map['jml_beli'] = _jmlBeli;
    map['harga'] = _harga;
    map['sub_total_produk'] = _subTotalProduk;
    map['catatan'] = _catatan;
    return map;
  }

}

/// jenis_order : "makan_ditempat"
/// transaksi_id : 57
/// nama_pemesan : ""
/// meja_nomor : "A1"
/// total : 100000

class Data_pemesan {
  Data_pemesan({
      String? jenisOrder, 
      int? transaksiId, 
      String? namaPemesan, 
      String? mejaNomor, 
      int? total,}){
    _jenisOrder = jenisOrder;
    _transaksiId = transaksiId;
    _namaPemesan = namaPemesan;
    _mejaNomor = mejaNomor;
    _total = total;
}

  Data_pemesan.fromJson(dynamic json) {
    _jenisOrder = json['jenis_order'];
    _transaksiId = json['transaksi_id'];
    _namaPemesan = json['nama_pemesan'];
    _mejaNomor = json['meja_nomor'];
    _total = json['total'];
  }
  String? _jenisOrder;
  int? _transaksiId;
  String? _namaPemesan;
  String? _mejaNomor;
  int? _total;

  String? get jenisOrder => _jenisOrder;
  int? get transaksiId => _transaksiId;
  String? get namaPemesan => _namaPemesan;
  String? get mejaNomor => _mejaNomor;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['jenis_order'] = _jenisOrder;
    map['transaksi_id'] = _transaksiId;
    map['nama_pemesan'] = _namaPemesan;
    map['meja_nomor'] = _mejaNomor;
    map['total'] = _total;
    return map;
  }

}