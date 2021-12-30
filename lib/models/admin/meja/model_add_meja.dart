/// notif_st : true
/// notif_msg : "Successfully retrieved data."
/// data : {"outlet":[{"role_id":5,"group_id":"3","parent_id":null,"role_nm":"Soyummy timika diana","role_desc":"jl budiutomo timika papua","mdd":null,"inisial_meja":"TD","aktif_st":"1","default_gudang":"0","retail_st":"1"},{"role_id":9,"group_id":"3","parent_id":null,"role_nm":"Soyummy timika Yos sudarso","role_desc":"jl Yos Sudarso timika papua","mdd":null,"inisial_meja":"TY","aktif_st":"1","default_gudang":"0","retail_st":"1"},{"role_id":22,"group_id":"4","parent_id":null,"role_nm":"Timika brownies","role_desc":"Testing ","mdd":"2021-08-07T13:10:30.000Z","inisial_meja":"TB","aktif_st":"1","default_gudang":"0","retail_st":"1"},{"role_id":28,"group_id":"3","parent_id":null,"role_nm":"Outlet jkt","role_desc":"testing","mdd":"2021-11-15T14:42:27.000Z","inisial_meja":"OJ","aktif_st":"1","default_gudang":"0","retail_st":"0"}]}

class ModelAddMeja {
  ModelAddMeja({
      this.notifSt, 
      this.notifMsg, 
      this.data,});

  ModelAddMeja.fromJson(dynamic json) {
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

/// outlet : [{"role_id":5,"group_id":"3","parent_id":null,"role_nm":"Soyummy timika diana","role_desc":"jl budiutomo timika papua","mdd":null,"inisial_meja":"TD","aktif_st":"1","default_gudang":"0","retail_st":"1"},{"role_id":9,"group_id":"3","parent_id":null,"role_nm":"Soyummy timika Yos sudarso","role_desc":"jl Yos Sudarso timika papua","mdd":null,"inisial_meja":"TY","aktif_st":"1","default_gudang":"0","retail_st":"1"},{"role_id":22,"group_id":"4","parent_id":null,"role_nm":"Timika brownies","role_desc":"Testing ","mdd":"2021-08-07T13:10:30.000Z","inisial_meja":"TB","aktif_st":"1","default_gudang":"0","retail_st":"1"},{"role_id":28,"group_id":"3","parent_id":null,"role_nm":"Outlet jkt","role_desc":"testing","mdd":"2021-11-15T14:42:27.000Z","inisial_meja":"OJ","aktif_st":"1","default_gudang":"0","retail_st":"0"}]

class Data {
  Data({
      this.outlet,});

  Data.fromJson(dynamic json) {
    if (json['outlet'] != null) {
      outlet = [];
      json['outlet'].forEach((v) {
        outlet?.add(Outlet.fromJson(v));
      });
    }
  }
  List<Outlet>? outlet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (outlet != null) {
      map['outlet'] = outlet?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// role_id : 5
/// group_id : "3"
/// parent_id : null
/// role_nm : "Soyummy timika diana"
/// role_desc : "jl budiutomo timika papua"
/// mdd : null
/// inisial_meja : "TD"
/// aktif_st : "1"
/// default_gudang : "0"
/// retail_st : "1"

class Outlet {
  Outlet({
      this.roleId, 
      this.groupId, 
      this.parentId, 
      this.roleNm, 
      this.roleDesc, 
      this.mdd, 
      this.inisialMeja, 
      this.aktifSt, 
      this.defaultGudang, 
      this.retailSt,});

  Outlet.fromJson(dynamic json) {
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
  String? roleDesc;
  dynamic mdd;
  String? inisialMeja;
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