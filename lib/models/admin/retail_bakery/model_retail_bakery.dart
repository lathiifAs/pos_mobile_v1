/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"array_retail":[{"role_id":15,"group_id":"4","parent_id":null,"role_nm":"Retail 1 Edit","role_desc":"Testing","mdd":"2021-08-02T14:36:45.000Z","aktif_st":"1","default_gudang":"0"}]}

class ModelRetailBakery {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelRetailBakery({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelRetailBakery.fromJson(dynamic json) {
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

/// array_retail : [{
/// "role_id":15,"group_id":"4",
/// "parent_id":null,
/// "role_nm":"Retail 1 Edit","role_desc":"Testing","mdd":"2021-08-02T14:36:45.000Z","aktif_st":"1","default_gudang":"0"}]

class Data {
  List<Array_retail>? _arrayRetail;

  List<Array_retail>? get arrayRetail => _arrayRetail;

  Data({
      List<Array_retail>? arrayRetail}){
    _arrayRetail = arrayRetail;
}

  Data.fromJson(dynamic json) {
    if (json["array_retail"] != null) {
      _arrayRetail = [];
      json["array_retail"].forEach((v) {
        _arrayRetail?.add(Array_retail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayRetail != null) {
      map["array_retail"] = _arrayRetail?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// role_id : 15
/// group_id : "4"
/// parent_id : null
/// role_nm : "Retail 1 Edit"
/// role_desc : "Testing"
/// mdd : "2021-08-02T14:36:45.000Z"
/// aktif_st : "1"
/// default_gudang : "0"

class Array_retail {
  int? _roleId;
  String? _groupId;
  dynamic? _parentId;
  String? _roleNm;
  String? _roleDesc;
  String? _mdd;
  String? _aktifSt;
  String? _defaultGudang;

  int? get roleId => _roleId;
  String? get groupId => _groupId;
  dynamic? get parentId => _parentId;
  String? get roleNm => _roleNm;
  String? get roleDesc => _roleDesc;
  String? get mdd => _mdd;
  String? get aktifSt => _aktifSt;
  String? get defaultGudang => _defaultGudang;

  Array_retail({
      int? roleId, 
      String? groupId, 
      dynamic? parentId, 
      String? roleNm, 
      String? roleDesc, 
      String? mdd, 
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

  Array_retail.fromJson(dynamic json) {
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