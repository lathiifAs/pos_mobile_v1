/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : [{"array_gudang":[{"role_id":2,"group_id":"2","parent_id":null,"role_nm":"Gudang Induk","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"1"},{"role_id":3,"group_id":"2","parent_id":"2","role_nm":"Gudang Anak 1","role_desc":"Testing","mdd":null,"aktif_st":"1","default_gudang":"0"},{"role_id":4,"group_id":"2","parent_id":"2","role_nm":"Gudang Anak 2","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"0"}]}]

class ModelListAddGudang {
  bool? _notifSt;
  String? _notifMsg;
  List<Data>? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  List<Data>? get data => _data;

  ModelListAddGudang({
      bool? notifSt, 
      String? notifMsg, 
      List<Data>? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelListAddGudang.fromJson(dynamic json) {
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

/// array_gudang : [{"role_id":2,"group_id":"2","parent_id":null,"role_nm":"Gudang Induk","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"1"},{"role_id":3,"group_id":"2","parent_id":"2","role_nm":"Gudang Anak 1","role_desc":"Testing","mdd":null,"aktif_st":"1","default_gudang":"0"},{"role_id":4,"group_id":"2","parent_id":"2","role_nm":"Gudang Anak 2","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"0"}]

class Data {
  List<Array_gudang>? _arrayGudang;

  List<Array_gudang>? get arrayGudang => _arrayGudang;

  Data({
      List<Array_gudang>? arrayGudang}){
    _arrayGudang = arrayGudang;
}

  Data.fromJson(dynamic json) {
    if (json["array_gudang"] != null) {
      _arrayGudang = [];
      json["array_gudang"].forEach((v) {
        _arrayGudang?.add(Array_gudang.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayGudang != null) {
      map["array_gudang"] = _arrayGudang?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// role_id : 2
/// group_id : "2"
/// parent_id : null
/// role_nm : "Gudang Induk"
/// role_desc : null
/// mdd : null
/// aktif_st : "1"
/// default_gudang : "1"

class Array_gudang {
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

  Array_gudang({
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

  Array_gudang.fromJson(dynamic json) {
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