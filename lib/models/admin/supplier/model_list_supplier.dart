/// notif_st : true
/// notif_msg : "Successfully retrieved data."
/// data : {"array_supplier":[{"supplier_id":2,"number":123456789,"supplier_nama":"Junedi","supplier_alamat":"Sleman","supplier_keterangan":"desc","supplier_hp":"08123456987","pic":"this pic","bank_account":"Junedi","bank_rekening":"9996663335","bank_name":"BRI","supplier_email":"junedi@gmail.com","aktif_st":"1"}]}

class ModelListSupplier {
  ModelListSupplier({
      this.notifSt, 
      this.notifMsg, 
      this.data,});

  ModelListSupplier.fromJson(dynamic json) {
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

/// array_supplier : [{"supplier_id":2,"number":123456789,"supplier_nama":"Junedi","supplier_alamat":"Sleman","supplier_keterangan":"desc","supplier_hp":"08123456987","pic":"this pic","bank_account":"Junedi","bank_rekening":"9996663335","bank_name":"BRI","supplier_email":"junedi@gmail.com","aktif_st":"1"}]

class Data {
  Data({
      this.arraySupplier,});

  Data.fromJson(dynamic json) {
    if (json['array_supplier'] != null) {
      arraySupplier = [];
      json['array_supplier'].forEach((v) {
        arraySupplier?.add(Array_supplier.fromJson(v));
      });
    }
  }
  List<Array_supplier>? arraySupplier;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (arraySupplier != null) {
      map['array_supplier'] = arraySupplier?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// supplier_id : 2
/// number : 123456789
/// supplier_nama : "Junedi"
/// supplier_alamat : "Sleman"
/// supplier_keterangan : "desc"
/// supplier_hp : "08123456987"
/// pic : "this pic"
/// bank_account : "Junedi"
/// bank_rekening : "9996663335"
/// bank_name : "BRI"
/// supplier_email : "junedi@gmail.com"
/// aktif_st : "1"

class Array_supplier {
  Array_supplier({
      this.supplierId, 
      this.number, 
      this.supplierNama, 
      this.supplierAlamat, 
      this.supplierKeterangan, 
      this.supplierHp, 
      this.pic, 
      this.bankAccount, 
      this.bankRekening, 
      this.bankName, 
      this.supplierEmail, 
      this.aktifSt,});

  Array_supplier.fromJson(dynamic json) {
    supplierId = json['supplier_id'];
    number = json['number'];
    supplierNama = json['supplier_nama'];
    supplierAlamat = json['supplier_alamat'];
    supplierKeterangan = json['supplier_keterangan'];
    supplierHp = json['supplier_hp'];
    pic = json['pic'];
    bankAccount = json['bank_account'];
    bankRekening = json['bank_rekening'];
    bankName = json['bank_name'];
    supplierEmail = json['supplier_email'];
    aktifSt = json['aktif_st'];
  }
  int? supplierId;
  int? number;
  String? supplierNama;
  String? supplierAlamat;
  String? supplierKeterangan;
  String? supplierHp;
  String? pic;
  String? bankAccount;
  String? bankRekening;
  String? bankName;
  String? supplierEmail;
  String? aktifSt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['supplier_id'] = supplierId;
    map['number'] = number;
    map['supplier_nama'] = supplierNama;
    map['supplier_alamat'] = supplierAlamat;
    map['supplier_keterangan'] = supplierKeterangan;
    map['supplier_hp'] = supplierHp;
    map['pic'] = pic;
    map['bank_account'] = bankAccount;
    map['bank_rekening'] = bankRekening;
    map['bank_name'] = bankName;
    map['supplier_email'] = supplierEmail;
    map['aktif_st'] = aktifSt;
    return map;
  }

}