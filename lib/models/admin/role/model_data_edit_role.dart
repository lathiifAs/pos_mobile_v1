/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"group_nama":"Admin","role_id":1,"group_id":"1","parent_id":null,"role_nm":"Administrator","role_desc":"admin","mdd":"2021-07-17T14:40:57.000Z","aktif_st":"1","default_gudang":"0","parent_name":null}

class ModelDataEditRole {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelDataEditRole({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelDataEditRole.fromJson(dynamic json) {
    _notifSt = json["notif_st"];
    _notifMsg = json["notif_msg"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["notif_st"] = _notifSt;
    map["notif_msg"] = _notifMsg;
    if (_data != null) {
      map["data"] = _data?.toJson();
    }
    return map;
  }

}

/// group_nama : "Admin"
/// role_id : 1
/// group_id : "1"
/// parent_id : null
/// role_nm : "Administrator"
/// role_desc : "admin"
/// mdd : "2021-07-17T14:40:57.000Z"
/// aktif_st : "1"
/// default_gudang : "0"
/// parent_name : null

class Data {
  String? _groupNama;
  int? _roleId;
  String? _groupId;
  dynamic? _parentId;
  String? _roleNm;
  String? _roleDesc;
  String? _mdd;
  String? _aktifSt;
  String? _defaultGudang;
  dynamic? _parentName;

  String? get groupNama => _groupNama;
  int? get roleId => _roleId;
  String? get groupId => _groupId;
  dynamic? get parentId => _parentId;
  String? get roleNm => _roleNm;
  String? get roleDesc => _roleDesc;
  String? get mdd => _mdd;
  String? get aktifSt => _aktifSt;
  String? get defaultGudang => _defaultGudang;
  dynamic? get parentName => _parentName;

  Data({
      String? groupNama, 
      int? roleId, 
      String? groupId, 
      dynamic? parentId, 
      String? roleNm, 
      String? roleDesc, 
      String? mdd, 
      String? aktifSt, 
      String? defaultGudang, 
      dynamic? parentName}){
    _groupNama = groupNama;
    _roleId = roleId;
    _groupId = groupId;
    _parentId = parentId;
    _roleNm = roleNm;
    _roleDesc = roleDesc;
    _mdd = mdd;
    _aktifSt = aktifSt;
    _defaultGudang = defaultGudang;
    _parentName = parentName;
}

  Data.fromJson(dynamic json) {
    _groupNama = json["group_nama"];
    _roleId = json["role_id"];
    _groupId = json["group_id"];
    _parentId = json["parent_id"];
    _roleNm = json["role_nm"];
    _roleDesc = json["role_desc"];
    _mdd = json["mdd"];
    _aktifSt = json["aktif_st"];
    _defaultGudang = json["default_gudang"];
    _parentName = json["parent_name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["group_nama"] = _groupNama;
    map["role_id"] = _roleId;
    map["group_id"] = _groupId;
    map["parent_id"] = _parentId;
    map["role_nm"] = _roleNm;
    map["role_desc"] = _roleDesc;
    map["mdd"] = _mdd;
    map["aktif_st"] = _aktifSt;
    map["default_gudang"] = _defaultGudang;
    map["parent_name"] = _parentName;
    return map;
  }

}