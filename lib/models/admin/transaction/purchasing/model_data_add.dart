/// notif_st : true
/// notif_msg : "Successfully retrieved data."
/// data : {"array_gudang":[{"role_id":2,"group_id":"2","parent_id":null,"role_nm":"Gudang Pusat","role_desc":null,"mdd":null,"inisial_meja":null,"aktif_st":"1","default_gudang":"1","retail_st":"0"},{"role_id":3,"group_id":"2","parent_id":null,"role_nm":"Gudang Timika diana","role_desc":"Testing","mdd":null,"inisial_meja":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"},{"role_id":4,"group_id":"2","parent_id":null,"role_nm":"Gudang Timika Yos Sudarso","role_desc":null,"mdd":null,"inisial_meja":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"},{"role_id":27,"group_id":"2","parent_id":null,"role_nm":"Gudang Sleman","role_desc":"testing desc","mdd":"2021-11-08T06:12:49.000Z","inisial_meja":null,"aktif_st":"1","default_gudang":"0","retail_st":"0"}],"array_supplier":[{"supplier_id":2,"number":123456789,"supplier_nama":"Junedi","supplier_alamat":"Sleman","supplier_keterangan":"desc","supplier_hp":"08123456987","pic":"this pic","bank_account":"Junedi","bank_rekening":"9996663335","bank_name":"BRI","supplier_email":"junedi@gmail.com","aktif_st":"1"}],"array_produk":[{"produk_id":77,"kode_produk":null,"alias":null,"produk_group_id":1,"sub_produk_group_id":14,"kitchen_id":null,"sales_group_id":null,"produk_nama":"Kentang","produk_harga":10000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":521,"ranking":null,"satuan_id":1,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":"Ton"},{"produk_id":78,"kode_produk":null,"alias":null,"produk_group_id":1,"sub_produk_group_id":14,"kitchen_id":null,"sales_group_id":null,"produk_nama":"beras","produk_harga":20000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":10,"ranking":null,"satuan_id":1,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":"Ton"},{"produk_id":79,"kode_produk":null,"alias":null,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":2,"sales_group_id":7,"produk_nama":"Nasi Goreng","produk_harga":40000,"produk_gambar_nama":"nasgor.jpeg","produk_gambar_path":"/doc/produk_img/","stok":0,"ranking":5,"satuan_id":null,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":null},{"produk_id":83,"kode_produk":null,"alias":null,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":8,"produk_nama":"Es Jeruk","produk_harga":20000,"produk_gambar_nama":"esjeruk.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"ranking":null,"satuan_id":null,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":null},{"produk_id":84,"kode_produk":null,"alias":null,"produk_group_id":3,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":9,"produk_nama":"Bolu kukus","produk_harga":25000,"produk_gambar_nama":"bolukukus.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"ranking":null,"satuan_id":3,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":"Gram"},{"produk_id":85,"kode_produk":null,"alias":null,"produk_group_id":3,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":10,"produk_nama":"Roti Buaya","produk_harga":30000,"produk_gambar_nama":"rutibuaya.jpeg","produk_gambar_path":"/doc/produk_img/","stok":0,"ranking":9,"satuan_id":3,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":"Gram"},{"produk_id":86,"kode_produk":null,"alias":null,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":10,"produk_nama":"Brownies coklat","produk_harga":55000,"produk_gambar_nama":"7CKalNxo5t-1631964456046.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"ranking":null,"satuan_id":null,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":null},{"produk_id":87,"kode_produk":null,"alias":null,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":9,"produk_nama":"Bolu","produk_harga":25000,"produk_gambar_nama":"nM44PfPDud-1631964586590.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"ranking":2,"satuan_id":null,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":null},{"produk_id":88,"kode_produk":"1637157072965","alias":"","produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":7,"produk_nama":"bnmM","produk_harga":66666,"produk_gambar_nama":"peKrnXrB25-1637157072965.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"ranking":9,"satuan_id":null,"min_stok":5,"max_stok":6,"fav_st":"0","aktif_st":"1","satuan_nama":null}]}

class ModelDataAdd {
  ModelDataAdd({
    this.notifSt,
    this.notifMsg,
    this.data,
  });

  ModelDataAdd.fromJson(dynamic json) {
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

/// array_gudang : [{"role_id":2,"group_id":"2","parent_id":null,"role_nm":"Gudang Pusat","role_desc":null,"mdd":null,"inisial_meja":null,"aktif_st":"1","default_gudang":"1","retail_st":"0"},{"role_id":3,"group_id":"2","parent_id":null,"role_nm":"Gudang Timika diana","role_desc":"Testing","mdd":null,"inisial_meja":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"},{"role_id":4,"group_id":"2","parent_id":null,"role_nm":"Gudang Timika Yos Sudarso","role_desc":null,"mdd":null,"inisial_meja":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"},{"role_id":27,"group_id":"2","parent_id":null,"role_nm":"Gudang Sleman","role_desc":"testing desc","mdd":"2021-11-08T06:12:49.000Z","inisial_meja":null,"aktif_st":"1","default_gudang":"0","retail_st":"0"}]
/// array_supplier : [{"supplier_id":2,"number":123456789,"supplier_nama":"Junedi","supplier_alamat":"Sleman","supplier_keterangan":"desc","supplier_hp":"08123456987","pic":"this pic","bank_account":"Junedi","bank_rekening":"9996663335","bank_name":"BRI","supplier_email":"junedi@gmail.com","aktif_st":"1"}]
/// array_produk : [{"produk_id":77,"kode_produk":null,"alias":null,"produk_group_id":1,"sub_produk_group_id":14,"kitchen_id":null,"sales_group_id":null,"produk_nama":"Kentang","produk_harga":10000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":521,"ranking":null,"satuan_id":1,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":"Ton"},{"produk_id":78,"kode_produk":null,"alias":null,"produk_group_id":1,"sub_produk_group_id":14,"kitchen_id":null,"sales_group_id":null,"produk_nama":"beras","produk_harga":20000,"produk_gambar_nama":"hdPGT6YTFB-1630756076109.jpg","produk_gambar_path":"/doc/produk_img/","stok":10,"ranking":null,"satuan_id":1,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":"Ton"},{"produk_id":79,"kode_produk":null,"alias":null,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":2,"sales_group_id":7,"produk_nama":"Nasi Goreng","produk_harga":40000,"produk_gambar_nama":"nasgor.jpeg","produk_gambar_path":"/doc/produk_img/","stok":0,"ranking":5,"satuan_id":null,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":null},{"produk_id":83,"kode_produk":null,"alias":null,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":8,"produk_nama":"Es Jeruk","produk_harga":20000,"produk_gambar_nama":"esjeruk.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"ranking":null,"satuan_id":null,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":null},{"produk_id":84,"kode_produk":null,"alias":null,"produk_group_id":3,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":9,"produk_nama":"Bolu kukus","produk_harga":25000,"produk_gambar_nama":"bolukukus.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"ranking":null,"satuan_id":3,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":"Gram"},{"produk_id":85,"kode_produk":null,"alias":null,"produk_group_id":3,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":10,"produk_nama":"Roti Buaya","produk_harga":30000,"produk_gambar_nama":"rutibuaya.jpeg","produk_gambar_path":"/doc/produk_img/","stok":0,"ranking":9,"satuan_id":3,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":"Gram"},{"produk_id":86,"kode_produk":null,"alias":null,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":10,"produk_nama":"Brownies coklat","produk_harga":55000,"produk_gambar_nama":"7CKalNxo5t-1631964456046.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"ranking":null,"satuan_id":null,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":null},{"produk_id":87,"kode_produk":null,"alias":null,"produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":9,"produk_nama":"Bolu","produk_harga":25000,"produk_gambar_nama":"nM44PfPDud-1631964586590.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"ranking":2,"satuan_id":null,"min_stok":null,"max_stok":null,"fav_st":"0","aktif_st":"1","satuan_nama":null},{"produk_id":88,"kode_produk":"1637157072965","alias":"","produk_group_id":2,"sub_produk_group_id":null,"kitchen_id":1,"sales_group_id":7,"produk_nama":"bnmM","produk_harga":66666,"produk_gambar_nama":"peKrnXrB25-1637157072965.jpg","produk_gambar_path":"/doc/produk_img/","stok":0,"ranking":9,"satuan_id":null,"min_stok":5,"max_stok":6,"fav_st":"0","aktif_st":"1","satuan_nama":null}]

class Data {
  Data({
    this.arrayGudang,
    this.arraySupplier,
    this.arrayProduk,
  });

  Data.fromJson(dynamic json) {
    if (json['array_gudang'] != null) {
      arrayGudang = [];
      json['array_gudang'].forEach((v) {
        arrayGudang?.add(Array_gudang.fromJson(v));
      });
    }
    if (json['array_supplier'] != null) {
      arraySupplier = [];
      json['array_supplier'].forEach((v) {
        arraySupplier?.add(Array_supplier.fromJson(v));
      });
    }
    if (json['array_produk'] != null) {
      arrayProduk = [];
      json['array_produk'].forEach((v) {
        arrayProduk?.add(Array_produk.fromJson(v));
      });
    }
  }

  List<Array_gudang>? arrayGudang;
  List<Array_supplier>? arraySupplier;
  List<Array_produk>? arrayProduk;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (arrayGudang != null) {
      map['array_gudang'] = arrayGudang?.map((v) => v.toJson()).toList();
    }
    if (arraySupplier != null) {
      map['array_supplier'] = arraySupplier?.map((v) => v.toJson()).toList();
    }
    if (arrayProduk != null) {
      map['array_produk'] = arrayProduk?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// produk_id : 77
/// kode_produk : null
/// alias : null
/// produk_group_id : 1
/// sub_produk_group_id : 14
/// kitchen_id : null
/// sales_group_id : null
/// produk_nama : "Kentang"
/// produk_harga : 10000
/// produk_gambar_nama : "hdPGT6YTFB-1630756076109.jpg"
/// produk_gambar_path : "/doc/produk_img/"
/// stok : 521
/// ranking : null
/// satuan_id : 1
/// min_stok : null
/// max_stok : null
/// fav_st : "0"
/// aktif_st : "1"
/// satuan_nama : "Ton"

class Array_produk {
  Array_produk({
    this.produkId,
    this.kodeProduk,
    this.alias,
    this.produkGroupId,
    this.subProdukGroupId,
    this.kitchenId,
    this.salesGroupId,
    this.produkNama,
    this.produkHarga,
    this.produkGambarNama,
    this.produkGambarPath,
    this.stok,
    this.ranking,
    this.satuanId,
    this.minStok,
    this.maxStok,
    this.favSt,
    this.aktifSt,
    this.satuanNama,
    this.isChoose,
  });

  Array_produk.fromJson(dynamic json) {
    produkId = json['produk_id'];
    kodeProduk = json['kode_produk'];
    alias = json['alias'];
    produkGroupId = json['produk_group_id'];
    subProdukGroupId = json['sub_produk_group_id'];
    kitchenId = json['kitchen_id'];
    salesGroupId = json['sales_group_id'];
    produkNama = json['produk_nama'];
    produkHarga = json['produk_harga'];
    produkGambarNama = json['produk_gambar_nama'];
    produkGambarPath = json['produk_gambar_path'];
    stok = json['stok'];
    ranking = json['ranking'];
    satuanId = json['satuan_id'];
    minStok = json['min_stok'];
    maxStok = json['max_stok'];
    favSt = json['fav_st'];
    aktifSt = json['aktif_st'];
    satuanNama = json['satuan_nama'];
  }

  int? produkId;
  dynamic kodeProduk;
  dynamic alias;
  int? produkGroupId;
  int? subProdukGroupId;
  dynamic kitchenId;
  dynamic salesGroupId;
  String? produkNama;
  int? produkHarga;
  String? produkGambarNama;
  String? produkGambarPath;
  int? stok;
  dynamic ranking;
  int? satuanId;
  dynamic minStok;
  dynamic maxStok;
  String? favSt;
  String? aktifSt;
  String? satuanNama;
  bool? isChoose = false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['produk_id'] = produkId;
    map['kode_produk'] = kodeProduk;
    map['alias'] = alias;
    map['produk_group_id'] = produkGroupId;
    map['sub_produk_group_id'] = subProdukGroupId;
    map['kitchen_id'] = kitchenId;
    map['sales_group_id'] = salesGroupId;
    map['produk_nama'] = produkNama;
    map['produk_harga'] = produkHarga;
    map['produk_gambar_nama'] = produkGambarNama;
    map['produk_gambar_path'] = produkGambarPath;
    map['stok'] = stok;
    map['ranking'] = ranking;
    map['satuan_id'] = satuanId;
    map['min_stok'] = minStok;
    map['max_stok'] = maxStok;
    map['fav_st'] = favSt;
    map['aktif_st'] = aktifSt;
    map['satuan_nama'] = satuanNama;
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
    this.aktifSt,
  });

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

/// role_id : 2
/// group_id : "2"
/// parent_id : null
/// role_nm : "Gudang Pusat"
/// role_desc : null
/// mdd : null
/// inisial_meja : null
/// aktif_st : "1"
/// default_gudang : "1"
/// retail_st : "0"

class Array_gudang {
  Array_gudang({
    this.roleId,
    this.groupId,
    this.parentId,
    this.roleNm,
    this.roleDesc,
    this.mdd,
    this.inisialMeja,
    this.aktifSt,
    this.defaultGudang,
    this.retailSt,
  });

  Array_gudang.fromJson(dynamic json) {
    roleId = json['role_id'];
    groupId = json['group_id'];
    parentId = json['parent_id'];
    roleNm = json['role_nm'];
    roleDesc = json['role_desc'];
    mdd = json['mdd'];
    inisialMeja = json['inisial_meja'];
    aktifSt = json['aktif_st'];
    defaultGudang = json['default_gudang'];
    retailSt = json['retail_st'];
  }

  int? roleId;
  String? groupId;
  dynamic parentId;
  String? roleNm;
  dynamic roleDesc;
  dynamic mdd;
  dynamic inisialMeja;
  String? aktifSt;
  String? defaultGudang;
  String? retailSt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role_id'] = roleId;
    map['group_id'] = groupId;
    map['parent_id'] = parentId;
    map['role_nm'] = roleNm;
    map['role_desc'] = roleDesc;
    map['mdd'] = mdd;
    map['inisial_meja'] = inisialMeja;
    map['aktif_st'] = aktifSt;
    map['default_gudang'] = defaultGudang;
    map['retail_st'] = retailSt;
    return map;
  }
}
