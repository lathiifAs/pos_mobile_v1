/// notif_st : true
/// notif_msg : "Successfully retrieved data."
/// data : [{"array_group":[{"group_id":"6","group_nama":"Kasir","group_desc":null,"retail_st":"0","role_karyawan_outlet_st":"1"},{"group_id":"7","group_nama":"Dapur","group_desc":null,"retail_st":"0","role_karyawan_outlet_st":"1"},{"group_id":"8","group_nama":"Waiters","group_desc":null,"retail_st":"0","role_karyawan_outlet_st":"1"}],"array_kitchen":[{"kitchen_id":1,"kitchen_nama":"kitchen makanan","kitchen_deskripsi":"Testing"},{"kitchen_id":2,"kitchen_nama":"kitchen minuman","kitchen_deskripsi":null}]}]

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

/// array_group : [{"group_id":"6","group_nama":"Kasir","group_desc":null,"retail_st":"0","role_karyawan_outlet_st":"1"},{"group_id":"7","group_nama":"Dapur","group_desc":null,"retail_st":"0","role_karyawan_outlet_st":"1"},{"group_id":"8","group_nama":"Waiters","group_desc":null,"retail_st":"0","role_karyawan_outlet_st":"1"}]
/// array_kitchen : [{"kitchen_id":1,"kitchen_nama":"kitchen makanan","kitchen_deskripsi":"Testing"},{"kitchen_id":2,"kitchen_nama":"kitchen minuman","kitchen_deskripsi":null}]

class Data {
  Data({
      this.arrayGroup, 
      this.arrayKitchen,});

  Data.fromJson(dynamic json) {
    if (json['array_group'] != null) {
      arrayGroup = [];
      json['array_group'].forEach((v) {
        arrayGroup?.add(Array_group.fromJson(v));
      });
    }
    if (json['array_kitchen'] != null) {
      arrayKitchen = [];
      json['array_kitchen'].forEach((v) {
        arrayKitchen?.add(Array_kitchen.fromJson(v));
      });
    }
  }
  List<Array_group>? arrayGroup;
  List<Array_kitchen>? arrayKitchen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (arrayGroup != null) {
      map['array_group'] = arrayGroup?.map((v) => v.toJson()).toList();
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

/// group_id : "6"
/// group_nama : "Kasir"
/// group_desc : null
/// retail_st : "0"
/// role_karyawan_outlet_st : "1"

class Array_group {
  Array_group({
      this.groupId, 
      this.groupNama, 
      this.groupDesc, 
      this.retailSt, 
      this.roleKaryawanOutletSt,});

  Array_group.fromJson(dynamic json) {
    groupId = json['group_id'];
    groupNama = json['group_nama'];
    groupDesc = json['group_desc'];
    retailSt = json['retail_st'];
    roleKaryawanOutletSt = json['role_karyawan_outlet_st'];
  }
  String? groupId;
  String? groupNama;
  dynamic groupDesc;
  String? retailSt;
  String? roleKaryawanOutletSt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['group_id'] = groupId;
    map['group_nama'] = groupNama;
    map['group_desc'] = groupDesc;
    map['retail_st'] = retailSt;
    map['role_karyawan_outlet_st'] = roleKaryawanOutletSt;
    return map;
  }

}