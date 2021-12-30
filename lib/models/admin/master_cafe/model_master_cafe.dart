/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : [{"array_cafe":[{"role_id":5,"group_id":"3","parent_id":null,"role_nm":"Cafe ivy","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"0"},{"role_id":8,"group_id":"3","parent_id":"5","role_nm":"Dapur","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"0"},{"role_id":11,"group_id":"3","parent_id":"9","role_nm":"Waiters","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"0"},{"role_id":12,"group_id":"3","parent_id":"9","role_nm":"Dapur","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"0"}]}]

class ModelMasterCafe {
  bool? _notifSt;
  String? _notifMsg;
  List<Data>? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  List<Data>? get data => _data;

  ModelMasterCafe({
      bool? notifSt, 
      String? notifMsg, 
      List<Data>? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelMasterCafe.fromJson(dynamic json) {
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

/// array_cafe : [{"role_id":5,"group_id":"3","parent_id":null,"role_nm":"Cafe ivy","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"0"},{"role_id":8,"group_id":"3","parent_id":"5","role_nm":"Dapur","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"0"},{"role_id":11,"group_id":"3","parent_id":"9","role_nm":"Waiters","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"0"},{"role_id":12,"group_id":"3","parent_id":"9","role_nm":"Dapur","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"0"}]

class Data {
  List<Array_cafe>? _arrayCafe;

  List<Array_cafe>? get arrayCafe => _arrayCafe;

  Data({
      List<Array_cafe>? arrayCafe}){
    _arrayCafe = arrayCafe;
}

  Data.fromJson(dynamic json) {
    if (json["array_cafe"] != null) {
      _arrayCafe = [];
      json["array_cafe"].forEach((v) {
        _arrayCafe?.add(Array_cafe.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayCafe != null) {
      map["array_cafe"] = _arrayCafe?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// role_id : 5
/// group_id : "3"
/// parent_id : null
/// role_nm : "Cafe ivy"
/// role_desc : null
/// mdd : null
/// aktif_st : "1"
/// default_gudang : "0"

class Array_cafe {
  int? _roleId;
  String? _groupId;
  dynamic? _parentId;
  String? _roleNm;
  dynamic? _roleDesc;
  dynamic? _mdd;
  String? _aktifSt;
  String? _defaultGudang;

  int? get roleId => _roleId;
  String? get groupId => _groupId;
  dynamic? get parentId => _parentId;
  String? get roleNm => _roleNm;
  dynamic? get roleDesc => _roleDesc;
  dynamic? get mdd => _mdd;
  String? get aktifSt => _aktifSt;
  String? get defaultGudang => _defaultGudang;

  Array_cafe({
      int? roleId, 
      String? groupId, 
      dynamic? parentId, 
      String? roleNm, 
      dynamic? roleDesc, 
      dynamic? mdd, 
      String? aktifSt, 
      String? defaultGudang}){
    _roleId = roleId;
    _groupId = groupId;
    _parentId = parentId;
    _roleNm = roleNm;
    _roleDesc = roleDesc;
    _mdd = mdd;
    _aktifSt = aktifSt;
    _defaultGudang = defaultGudang;
}

  Array_cafe.fromJson(dynamic json) {
    _roleId = json["role_id"];
    _groupId = json["group_id"];
    _parentId = json["parent_id"];
    _roleNm = json["role_nm"];
    _roleDesc = json["role_desc"];
    _mdd = json["mdd"];
    _aktifSt = json["aktif_st"];
    _defaultGudang = json["default_gudang"];
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
    map["default_gudang"] = _defaultGudang;
    return map;
  }

}