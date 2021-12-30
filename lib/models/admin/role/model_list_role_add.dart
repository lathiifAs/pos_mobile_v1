/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : [{"array_group":[{"group_id":"1","group_nama":"Admin","group_desc":null},{"group_id":"2","group_nama":"Cafe dan Resto","group_desc":null},{"group_id":"3","group_nama":"Retail Bakery","group_desc":null},{"group_id":"4","group_nama":"Member","group_desc":null}],"array_role":[{"role_id":1,"group_id":"1","parent_id":null,"role_nm":"Administrator","role_desc":"admin","mdd":"2021-07-17T14:40:57.000Z","aktif_st":"1"},{"role_id":3,"group_id":"2","parent_id":"2","role_nm":"Cafe 2 edit","role_desc":"Testing","mdd":null,"aktif_st":"1"},{"role_id":4,"group_id":"2","parent_id":"2","role_nm":"Waiters","role_desc":"Waiters","mdd":null,"aktif_st":"1"},{"role_id":5,"group_id":"2","parent_id":"2","role_nm":"Dapur","role_desc":"Dapur","mdd":null,"aktif_st":"1"},{"role_id":6,"group_id":"2","parent_id":null,"role_nm":"Cafe 3","role_desc":"Testing","mdd":"2021-07-21T14:51:36.000Z","aktif_st":"1"}]}]

class ModelListRoleAdd {
  bool? _notifSt;
  String? _notifMsg;
  List<Data>? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  List<Data>? get data => _data;

  ModelListRoleAdd({
      bool? notifSt, 
      String? notifMsg, 
      List<Data>? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelListRoleAdd.fromJson(dynamic json) {
    _notifSt = json["notif_st"];
    _notifMsg = json["notif_msg"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["notif_st"] = _notifSt;
    map["notif_msg"] = _notifMsg;
    if (_data != null) {
      map["data"] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// array_group : [{"group_id":"1","group_nama":"Admin","group_desc":null},{"group_id":"2","group_nama":"Cafe dan Resto","group_desc":null},{"group_id":"3","group_nama":"Retail Bakery","group_desc":null},{"group_id":"4","group_nama":"Member","group_desc":null}]
/// array_role : [{"role_id":1,"group_id":"1","parent_id":null,"role_nm":"Administrator","role_desc":"admin","mdd":"2021-07-17T14:40:57.000Z","aktif_st":"1"},{"role_id":3,"group_id":"2","parent_id":"2","role_nm":"Cafe 2 edit","role_desc":"Testing","mdd":null,"aktif_st":"1"},{"role_id":4,"group_id":"2","parent_id":"2","role_nm":"Waiters","role_desc":"Waiters","mdd":null,"aktif_st":"1"},{"role_id":5,"group_id":"2","parent_id":"2","role_nm":"Dapur","role_desc":"Dapur","mdd":null,"aktif_st":"1"},{"role_id":6,"group_id":"2","parent_id":null,"role_nm":"Cafe 3","role_desc":"Testing","mdd":"2021-07-21T14:51:36.000Z","aktif_st":"1"}]

class Data {
  List<Array_group>? _arrayGroup;
  List<Array_role>? _arrayRole;

  List<Array_group>? get arrayGroup => _arrayGroup;
  List<Array_role>? get arrayRole => _arrayRole;

  Data({
      List<Array_group>? arrayGroup, 
      List<Array_role>? arrayRole}){
    _arrayGroup = arrayGroup;
    _arrayRole = arrayRole;
}

  Data.fromJson(dynamic json) {
    if (json["array_group"] != null) {
      _arrayGroup = [];
      json["array_group"].forEach((v) {
        _arrayGroup?.add(Array_group.fromJson(v));
      });
    }
    if (json["array_role"] != null) {
      _arrayRole = [];
      json["array_role"].forEach((v) {
        _arrayRole?.add(Array_role.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayGroup != null) {
      map["array_group"] = _arrayGroup?.map((v) => v.toJson()).toList();
    }
    if (_arrayRole != null) {
      map["array_role"] = _arrayRole?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// role_id : 1
/// group_id : "1"
/// parent_id : null
/// role_nm : "Administrator"
/// role_desc : "admin"
/// mdd : "2021-07-17T14:40:57.000Z"
/// aktif_st : "1"

class Array_role {
  int? _roleId;
  String? _groupId;
  dynamic? _parentId;
  String? _roleNm;
  String? _roleDesc;
  String? _mdd;
  String? _aktifSt;

  int? get roleId => _roleId;
  String? get groupId => _groupId;
  dynamic? get parentId => _parentId;
  String? get roleNm => _roleNm;
  String? get roleDesc => _roleDesc;
  String? get mdd => _mdd;
  String? get aktifSt => _aktifSt;

  Array_role({
      int? roleId, 
      String? groupId, 
      dynamic? parentId, 
      String? roleNm, 
      String? roleDesc, 
      String? mdd, 
      String? aktifSt}){
    _roleId = roleId;
    _groupId = groupId;
    _parentId = parentId;
    _roleNm = roleNm;
    _roleDesc = roleDesc;
    _mdd = mdd;
    _aktifSt = aktifSt;
}

  Array_role.fromJson(dynamic json) {
    _roleId = json["role_id"];
    _groupId = json["group_id"];
    _parentId = json["parent_id"];
    _roleNm = json["role_nm"];
    _roleDesc = json["role_desc"];
    _mdd = json["mdd"];
    _aktifSt = json["aktif_st"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["role_id"] = _roleId;
    map["group_id"] = _groupId;
    map["parent_id"] = _parentId;
    map["role_nm"] = _roleNm;
    map["role_desc"] = _roleDesc;
    map["mdd"] = _mdd;
    map["aktif_st"] = _aktifSt;
    return map;
  }

}

/// group_id : "1"
/// group_nama : "Admin"
/// group_desc : null

class Array_group {
  String? _groupId;
  String? _groupNama;
  dynamic? _groupDesc;

  String? get groupId => _groupId;
  String? get groupNama => _groupNama;
  dynamic? get groupDesc => _groupDesc;

  Array_group({
      String? groupId, 
      String? groupNama, 
      dynamic? groupDesc}){
    _groupId = groupId;
    _groupNama = groupNama;
    _groupDesc = groupDesc;
}

  Array_group.fromJson(dynamic json) {
    _groupId = json["group_id"];
    _groupNama = json["group_nama"];
    _groupDesc = json["group_desc"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["group_id"] = _groupId;
    map["group_nama"] = _groupNama;
    map["group_desc"] = _groupDesc;
    return map;
  }

}