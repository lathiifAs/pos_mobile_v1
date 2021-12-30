/// notif_st : true
/// notif_msg : "Successfully retrieved data."
/// data : {"array_list":[{"nama_gudang":"Gudang Pusat","supplier_nama":"Junedi","purchasing_id":12,"no_supplier":"01202001","warehouse_id":2,"supplier_id":2,"tgl_pembelian":"2021-01-26T17:00:00.000Z","status_pembelian":null,"catatan":"testing dari postman","tgl_reformat":"27 January 2021"}]}

class ModelListPurchase {
  ModelListPurchase({
      this.notifSt, 
      this.notifMsg, 
      this.data,});

  ModelListPurchase.fromJson(dynamic json) {
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

/// array_list : [{"nama_gudang":"Gudang Pusat","supplier_nama":"Junedi","purchasing_id":12,"no_supplier":"01202001","warehouse_id":2,"supplier_id":2,"tgl_pembelian":"2021-01-26T17:00:00.000Z","status_pembelian":null,"catatan":"testing dari postman","tgl_reformat":"27 January 2021"}]

class Data {
  Data({
      this.arrayList,});

  Data.fromJson(dynamic json) {
    if (json['array_list'] != null) {
      arrayList = [];
      json['array_list'].forEach((v) {
        arrayList?.add(Array_list.fromJson(v));
      });
    }
  }
  List<Array_list>? arrayList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (arrayList != null) {
      map['array_list'] = arrayList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// nama_gudang : "Gudang Pusat"
/// supplier_nama : "Junedi"
/// purchasing_id : 12
/// no_supplier : "01202001"
/// warehouse_id : 2
/// supplier_id : 2
/// tgl_pembelian : "2021-01-26T17:00:00.000Z"
/// status_pembelian : null
/// catatan : "testing dari postman"
/// tgl_reformat : "27 January 2021"

class Array_list {
  Array_list({
      this.namaGudang, 
      this.supplierNama, 
      this.purchasingId, 
      this.noSupplier, 
      this.warehouseId, 
      this.supplierId, 
      this.tglPembelian, 
      this.statusPembelian, 
      this.catatan, 
      this.tglReformat,});

  Array_list.fromJson(dynamic json) {
    namaGudang = json['nama_gudang'];
    supplierNama = json['supplier_nama'];
    purchasingId = json['purchasing_id'];
    noSupplier = json['no_supplier'];
    warehouseId = json['warehouse_id'];
    supplierId = json['supplier_id'];
    tglPembelian = json['tgl_pembelian'];
    statusPembelian = json['status_pembelian'];
    catatan = json['catatan'];
    tglReformat = json['tgl_reformat'];
  }
  String? namaGudang;
  String? supplierNama;
  int? purchasingId;
  String? noSupplier;
  int? warehouseId;
  int? supplierId;
  String? tglPembelian;
  dynamic statusPembelian;
  String? catatan;
  String? tglReformat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nama_gudang'] = namaGudang;
    map['supplier_nama'] = supplierNama;
    map['purchasing_id'] = purchasingId;
    map['no_supplier'] = noSupplier;
    map['warehouse_id'] = warehouseId;
    map['supplier_id'] = supplierId;
    map['tgl_pembelian'] = tglPembelian;
    map['status_pembelian'] = statusPembelian;
    map['catatan'] = catatan;
    map['tgl_reformat'] = tglReformat;
    return map;
  }

}