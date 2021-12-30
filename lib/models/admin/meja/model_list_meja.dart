/// notif_st : true
/// notif_msg : "Successfully retrieved data."
/// data : [{"list_outlet":[{"role_id":5,"group_id":"3","parent_id":null,"role_nm":"Soyummy timika diana","role_desc":"jl budiutomo timika papua","mdd":null,"inisial_meja":"TD","aktif_st":"1","default_gudang":"0","retail_st":"1","list_meja":[{"meja_id":11,"role_id":5,"meja_nomor":"TD1","aktif_st":"stand_by","name_reserv":null,"phone_reserv":null,"datetime_reserv":null,"remarks_reserv":null}]},{"role_id":9,"group_id":"3","parent_id":null,"role_nm":"Soyummy timika Yos sudarso","role_desc":"jl Yos Sudarso timika papua","mdd":null,"inisial_meja":"TY","aktif_st":"1","default_gudang":"0","retail_st":"1","list_meja":[{"meja_id":12,"role_id":9,"meja_nomor":"TY1","aktif_st":"stand_by","name_reserv":null,"phone_reserv":null,"datetime_reserv":null,"remarks_reserv":null}]},{"role_id":22,"group_id":"4","parent_id":null,"role_nm":"Timika brownies","role_desc":"Testing ","mdd":"2021-08-07T13:10:30.000Z","inisial_meja":"TB","aktif_st":"1","default_gudang":"0","retail_st":"1","list_meja":[]},{"role_id":28,"group_id":"3","parent_id":null,"role_nm":"Outlet jkt","role_desc":"testing","mdd":"2021-11-15T14:42:27.000Z","inisial_meja":"OJ","aktif_st":"1","default_gudang":"0","retail_st":"0","list_meja":[]}]}]

class ModelListMeja {
  ModelListMeja({
      this.notifSt, 
      this.notifMsg, 
      this.data,});

  ModelListMeja.fromJson(dynamic json) {
    notifSt = json['notif_st'];
    notifMsg = json['notif_msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataListOutlet.fromJson(v));
      });
    }
  }
  bool? notifSt;
  String? notifMsg;
  List<DataListOutlet>? data;

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

/// list_outlet : [{"role_id":5,"group_id":"3","parent_id":null,"role_nm":"Soyummy timika diana","role_desc":"jl budiutomo timika papua","mdd":null,"inisial_meja":"TD","aktif_st":"1","default_gudang":"0","retail_st":"1","list_meja":[{"meja_id":11,"role_id":5,"meja_nomor":"TD1","aktif_st":"stand_by","name_reserv":null,"phone_reserv":null,"datetime_reserv":null,"remarks_reserv":null}]},{"role_id":9,"group_id":"3","parent_id":null,"role_nm":"Soyummy timika Yos sudarso","role_desc":"jl Yos Sudarso timika papua","mdd":null,"inisial_meja":"TY","aktif_st":"1","default_gudang":"0","retail_st":"1","list_meja":[{"meja_id":12,"role_id":9,"meja_nomor":"TY1","aktif_st":"stand_by","name_reserv":null,"phone_reserv":null,"datetime_reserv":null,"remarks_reserv":null}]},{"role_id":22,"group_id":"4","parent_id":null,"role_nm":"Timika brownies","role_desc":"Testing ","mdd":"2021-08-07T13:10:30.000Z","inisial_meja":"TB","aktif_st":"1","default_gudang":"0","retail_st":"1","list_meja":[]},{"role_id":28,"group_id":"3","parent_id":null,"role_nm":"Outlet jkt","role_desc":"testing","mdd":"2021-11-15T14:42:27.000Z","inisial_meja":"OJ","aktif_st":"1","default_gudang":"0","retail_st":"0","list_meja":[]}]

class DataListOutlet {
  DataListOutlet({
      this.listOutlet,});

  DataListOutlet.fromJson(dynamic json) {
    if (json['list_outlet'] != null) {
      listOutlet = [];
      json['list_outlet'].forEach((v) {
        listOutlet?.add(List_outlet.fromJson(v));
      });
    }
  }
  List<List_outlet>? listOutlet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (listOutlet != null) {
      map['list_outlet'] = listOutlet?.map((v) => v.toJson()).toList();
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
/// list_meja : [{"meja_id":11,"role_id":5,"meja_nomor":"TD1","aktif_st":"stand_by","name_reserv":null,"phone_reserv":null,"datetime_reserv":null,"remarks_reserv":null}]

class List_outlet {
  List_outlet({
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
      this.listMeja,});

  List_outlet.fromJson(dynamic json) {
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
    if (json['list_meja'] != null) {
      listMeja = [];
      json['list_meja'].forEach((v) {
        listMeja?.add(List_meja.fromJson(v));
      });
    }
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
  List<List_meja>? listMeja;

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
    if (listMeja != null) {
      map['list_meja'] = listMeja?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// meja_id : 11
/// role_id : 5
/// meja_nomor : "TD1"
/// aktif_st : "stand_by"
/// name_reserv : null
/// phone_reserv : null
/// datetime_reserv : null
/// remarks_reserv : null

class List_meja {
  List_meja({
      this.mejaId, 
      this.roleId, 
      this.mejaNomor, 
      this.aktifSt, 
      this.nameReserv, 
      this.phoneReserv, 
      this.datetimeReserv, 
      this.remarksReserv,});

  List_meja.fromJson(dynamic json) {
    mejaId = json['meja_id'];
    roleId = json['role_id'];
    mejaNomor = json['meja_nomor'];
    aktifSt = json['aktif_st'];
    nameReserv = json['name_reserv'];
    phoneReserv = json['phone_reserv'];
    datetimeReserv = json['datetime_reserv'];
    remarksReserv = json['remarks_reserv'];
  }
  int? mejaId;
  int? roleId;
  String? mejaNomor;
  String? aktifSt;
  dynamic nameReserv;
  dynamic phoneReserv;
  dynamic datetimeReserv;
  dynamic remarksReserv;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meja_id'] = mejaId;
    map['role_id'] = roleId;
    map['meja_nomor'] = mejaNomor;
    map['aktif_st'] = aktifSt;
    map['name_reserv'] = nameReserv;
    map['phone_reserv'] = phoneReserv;
    map['datetime_reserv'] = datetimeReserv;
    map['remarks_reserv'] = remarksReserv;
    return map;
  }

}