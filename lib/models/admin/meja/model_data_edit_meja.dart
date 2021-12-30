/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"result":{"group_nama":"Cafe dan Resto","role_id":3,"group_id":"2","parent_id":"2","role_nm":"Kasir","role_desc":"Kasir","mdd":null,"aktif_st":"1"}}

class ModelDataEditMeja {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelDataEditMeja({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelDataEditMeja.fromJson(dynamic json) {
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

/// result : {"group_nama":"Cafe dan Resto","role_id":3,"group_id":"2","parent_id":"2","role_nm":"Kasir","role_desc":"Kasir","mdd":null,"aktif_st":"1"}

class Data {
  Result? _result;

  Result? get result => _result;

  Data({
      Result? result}){
    _result = result;
}

  Data.fromJson(dynamic json) {
    _result = json["result"] != null ? Result.fromJson(json["result"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_result != null) {
      map["result"] = _result?.toJson();
    }
    return map;
  }

}

/// group_nama : "Cafe dan Resto"
/// role_id : 3
/// group_id : "2"
/// parent_id : "2"
/// role_nm : "Kasir"
/// role_desc : "Kasir"
/// mdd : null
/// aktif_st : "1"

class Result {
  String? _groupNama;
  int? _roleId;
  String? _groupId;
  String? _parentId;
  String? _roleNm;
  String? _roleDesc;
  dynamic? _mdd;
  String? _aktifSt;

  String? get groupNama => _groupNama;
  int? get roleId => _roleId;
  String? get groupId => _groupId;
  String? get parentId => _parentId;
  String? get roleNm => _roleNm;
  String? get roleDesc => _roleDesc;
  dynamic? get mdd => _mdd;
  String? get aktifSt => _aktifSt;

  Result({
      String? groupNama, 
      int? roleId, 
      String? groupId, 
      String? parentId, 
      String? roleNm, 
      String? roleDesc, 
      dynamic? mdd, 
      String? aktifSt}){
    _groupNama = groupNama;
    _roleId = roleId;
    _groupId = groupId;
    _parentId = parentId;
    _roleNm = roleNm;
    _roleDesc = roleDesc;
    _mdd = mdd;
    _aktifSt = aktifSt;
}

  Result.fromJson(dynamic json) {
    _groupNama = json["group_nama"];
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
    map["group_nama"] = _groupNama;
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