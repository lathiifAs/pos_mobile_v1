/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : [{"array_role":[{"group_nama":"Kasir","role_id":25,"group_id":"6","parent_id":"22","role_nm":"Kasir Retail Timika","role_desc":"","mdd":"2021-09-18T11:50:14.000Z","aktif_st":"1","default_gudang":"0","retail_st":"0"}],"array_kitchen":[{"kitchen_id":1,"kitchen_nama":"kitchen makanan","kitchen_deskripsi":"Testing"},{"kitchen_id":2,"kitchen_nama":"kitchen minuman","kitchen_deskripsi":null}]}]

class ModelDataAdd {
  ModelDataAdd({
      this.notifSt, 
      this.notifMsg, 
      this.data,});

  ModelDataAdd.fromJson(dynamic json) {
    notifSt = json['notif_st'];
    notifMsg = json['notif_msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? notifSt;
  String? notifMsg;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notif_st'] = notifSt;
    map['notif_msg'] = notifMsg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// array_role : [{"group_nama":"Kasir","role_id":25,"group_id":"6","parent_id":"22","role_nm":"Kasir Retail Timika","role_desc":"","mdd":"2021-09-18T11:50:14.000Z","aktif_st":"1","default_gudang":"0","retail_st":"0"}]
/// array_kitchen : [{"kitchen_id":1,"kitchen_nama":"kitchen makanan","kitchen_deskripsi":"Testing"},{"kitchen_id":2,"kitchen_nama":"kitchen minuman","kitchen_deskripsi":null}]

class Data {
  Data({
      this.arrayRole, 
      this.arrayKitchen,});

  Data.fromJson(dynamic json) {
    if (json['array_role'] != null) {
      arrayRole = [];
      json['array_role'].forEach((v) {
        arrayRole?.add(Array_role.fromJson(v));
      });
    }
    if (json['array_kitchen'] != null) {
      arrayKitchen = [];
      json['array_kitchen'].forEach((v) {
        arrayKitchen?.add(Array_kitchen.fromJson(v));
      });
    }
  }
  List<Array_role>? arrayRole;
  List<Array_kitchen>? arrayKitchen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (arrayRole != null) {
      map['array_role'] = arrayRole?.map((v) => v.toJson()).toList();
    }
    if (arrayKitchen != null) {
      map['array_kitchen'] = arrayKitchen?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// kitchen_id : 1
/// kitchen_nama : "kitchen makanan"
/// kitchen_deskripsi : "Testing"

class Array_kitchen {
  Array_kitchen({
      this.kitchenId, 
      this.kitchenNama, 
      this.kitchenDeskripsi,});

  Array_kitchen.fromJson(dynamic json) {
    kitchenId = json['kitchen_id'];
    kitchenNama = json['kitchen_nama'];
    kitchenDeskripsi = json['kitchen_deskripsi'];
  }
  int? kitchenId;
  String? kitchenNama;
  String? kitchenDeskripsi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kitchen_id'] = kitchenId;
    map['kitchen_nama'] = kitchenNama;
    map['kitchen_deskripsi'] = kitchenDeskripsi;
    return map;
  }

}

/// group_nama : "Kasir"
/// role_id : 25
/// group_id : "6"
/// parent_id : "22"
/// role_nm : "Kasir Retail Timika"
/// role_desc : ""
/// mdd : "2021-09-18T11:50:14.000Z"
/// aktif_st : "1"
/// default_gudang : "0"
/// retail_st : "0"

class Array_role {
  Array_role({
      this.groupNama, 
      this.roleId, 
      this.groupId, 
      this.parentId, 
      this.roleNm, 
      this.roleDesc, 
      this.mdd, 
      this.aktifSt, 
      this.defaultGudang, 
      this.retailSt,});

  Array_role.fromJson(dynamic json) {
    groupNama = json['group_nama'];
    roleId = json['role_id'];
    groupId = json['group_id'];
    parentId = json['parent_id'];
    roleNm = json['role_nm'];
    roleDesc = json['role_desc'];
    mdd = json['mdd'];
    aktifSt = json['aktif_st'];
    defaultGudang = json['default_gudang'];
    retailSt = json['retail_st'];
  }
  String? groupNama;
  int? roleId;
  String? groupId;
  String? parentId;
  String? roleNm;
  String? roleDesc;
  String? mdd;
  String? aktifSt;
  String? defaultGudang;
  String? retailSt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['group_nama'] = groupNama;
    map['role_id'] = roleId;
    map['group_id'] = groupId;
    map['parent_id'] = parentId;
    map['role_nm'] = roleNm;
    map['role_desc'] = roleDesc;
    map['mdd'] = mdd;
    map['aktif_st'] = aktifSt;
    map['default_gudang'] = defaultGudang;
    map['retail_st'] = retailSt;
    return map;
  }

}