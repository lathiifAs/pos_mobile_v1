/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"array_list":[{"jenis_order":"makan_ditempat","nama_toko":"Soyummy timika diana","transaksi_id":55,"nama_pemesan":"","meja_nomor":"A1"},{"jenis_order":"makan_ditempat","nama_toko":"Soyummy timika diana","transaksi_id":56,"nama_pemesan":"","meja_nomor":"A1"}]}

class ModelListTransaction {
  ModelListTransaction({
      bool? notifSt, 
      String? notifMsg, 
      Data? data,}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelListTransaction.fromJson(dynamic json) {
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

/// array_list : [{"jenis_order":"makan_ditempat","nama_toko":"Soyummy timika diana","transaksi_id":55,"nama_pemesan":"","meja_nomor":"A1"},{"jenis_order":"makan_ditempat","nama_toko":"Soyummy timika diana","transaksi_id":56,"nama_pemesan":"","meja_nomor":"A1"}]

class Data {
  Data({
      List<Array_list>? arrayList,}){
    _arrayList = arrayList;
}

  Data.fromJson(dynamic json) {
    if (json['array_list'] != null) {
      _arrayList = [];
      json['array_list'].forEach((v) {
        _arrayList?.add(Array_list.fromJson(v));
      });
    }
  }
  List<Array_list>? _arrayList;

  List<Array_list>? get arrayList => _arrayList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_arrayList != null) {
      map['array_list'] = _arrayList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// jenis_order : "makan_ditempat"
/// nama_toko : "Soyummy timika diana"
/// transaksi_id : 55
/// nama_pemesan : ""
/// meja_nomor : "A1"

class Array_list {
  Array_list({
      String? jenisOrder, 
      String? namaToko, 
      int? transaksiId, 
      String? namaPemesan, 
      String? mejaNomor,}){
    _jenisOrder = jenisOrder;
    _namaToko = namaToko;
    _transaksiId = transaksiId;
    _namaPemesan = namaPemesan;
    _mejaNomor = mejaNomor;
}

  Array_list.fromJson(dynamic json) {
    _jenisOrder = json['jenis_order'];
    _namaToko = json['nama_toko'];
    _transaksiId = json['transaksi_id'];
    _namaPemesan = json['nama_pemesan'];
    _mejaNomor = json['meja_nomor'];
  }
  String? _jenisOrder;
  String? _namaToko;
  int? _transaksiId;
  String? _namaPemesan;
  String? _mejaNomor;

  String? get jenisOrder => _jenisOrder;
  String? get namaToko => _namaToko;
  int? get transaksiId => _transaksiId;
  String? get namaPemesan => _namaPemesan;
  String? get mejaNomor => _mejaNomor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['jenis_order'] = _jenisOrder;
    map['nama_toko'] = _namaToko;
    map['transaksi_id'] = _transaksiId;
    map['nama_pemesan'] = _namaPemesan;
    map['meja_nomor'] = _mejaNomor;
    return map;
  }

}