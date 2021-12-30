/// notif_st : true
/// notif_msg : "Successfully retrieved data."
/// data : {"result":{"group_nama":"Gudang","role_id":2,"group_id":"2","parent_id":"","role_nm":"Gudang Pusat","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"1","retail_st":"0"}}

class ModelMasterEditGudang {
  ModelMasterEditGudang({
      this.notifSt, 
      this.notifMsg, 
      this.data,});

  ModelMasterEditGudang.fromJson(dynamic json) {
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

/// result : {"group_nama":"Gudang","role_id":2,"group_id":"2","parent_id":"","role_nm":"Gudang Pusat","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"1","retail_st":"0"}

class Data {
  Data({
      this.result,});

  Data.fromJson(dynamic json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }

}

/// group_nama : "Gudang"
/// role_id : 2
/// group_id : "2"
/// parent_id : ""
/// role_nm : "Gudang Pusat"
/// role_desc : null
/// mdd : null
/// aktif_st : "1"
/// default_gudang : "1"
/// retail_st : "0"

class Result {
  Result({
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

  Result.fromJson(dynamic json) {
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
  dynamic roleDesc;
  dynamic mdd;
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