/// notif_st : true
/// notif_msg : "Successfully retrieved data."
/// data : {"array_retail":[{"role_id":2,"group_id":"2","parent_id":"","role_nm":"Gudang Pusat","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"1","retail_st":"0"},{"role_id":3,"group_id":"2","parent_id":"","role_nm":"Gudang Timika diana","role_desc":"Testing","mdd":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"},{"role_id":4,"group_id":"2","parent_id":"","role_nm":"Gudang Timika Yos Sudarso","role_desc":null,"mdd":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"}]}

class ModelListMasterGudang {
  ModelListMasterGudang({
      this.notifSt, 
      this.notifMsg, 
      this.data,});

  ModelListMasterGudang.fromJson(dynamic json) {
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

/// array_retail : [{"role_id":2,"group_id":"2","parent_id":"","role_nm":"Gudang Pusat","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"1","retail_st":"0"},{"role_id":3,"group_id":"2","parent_id":"","role_nm":"Gudang Timika diana","role_desc":"Testing","mdd":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"},{"role_id":4,"group_id":"2","parent_id":"","role_nm":"Gudang Timika Yos Sudarso","role_desc":null,"mdd":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"}]

class Data {
  Data({
      this.arrayRetail,});

  Data.fromJson(dynamic json) {
    if (json['array_retail'] != null) {
      arrayRetail = [];
      json['array_retail'].forEach((v) {
        arrayRetail?.add(Array_retail.fromJson(v));
      });
    }
  }
  List<Array_retail>? arrayRetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (arrayRetail != null) {
      map['array_retail'] = arrayRetail?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// role_id : 2
/// group_id : "2"
/// parent_id : ""
/// role_nm : "Gudang Pusat"
/// role_desc : null
/// mdd : null
/// aktif_st : "1"
/// default_gudang : "1"
/// retail_st : "0"

class Array_retail {
  Array_retail({
      this.roleId, 
      this.groupId, 
      this.parentId, 
      this.roleNm, 
      this.roleDesc, 
      this.mdd, 
      this.aktifSt, 
      this.defaultGudang, 
      this.retailSt,});

  Array_retail.fromJson(dynamic json) {
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
  int? roleId;
  String? groupId;
  String? parentId;
  String? roleNm;
  dynamic roleDesc;
  dynamic mdd;
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
    map['aktif_st'] = aktifSt;
    map['default_gudang'] = defaultGudang;
    map['retail_st'] = retailSt;
    return map;
  }

}