/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : [{"role_id":0,"group_id":"7","parent_id":null,"role_nm":"dapur 3","role_desc":null,"mdd":null,"aktif_st":null,"default_gudang":"0","group_nama":"Dapur","group_desc":null,"parent_name":""},{"role_id":1,"group_id":"1","parent_id":null,"role_nm":"Administrator","role_desc":"admin","mdd":"2021-07-17T14:40:57.000Z","aktif_st":"1","default_gudang":"0","group_nama":"Admin","group_desc":null,"parent_name":""},{"role_id":2,"group_id":"2","parent_id":null,"role_nm":"Gudang Induk","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"1","group_nama":"Gudang","group_desc":null,"parent_name":""},{"role_id":3,"group_id":"2","parent_id":"2","role_nm":"Gudang Anak 1","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"0","group_nama":"Gudang","group_desc":null,"parent_name":"Gudang Induk"},{"role_id":4,"group_id":"2","parent_id":"2","role_nm":"Gudang Anak 2","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"0","group_nama":"Gudang","group_desc":null,"parent_name":"Gudang Induk"},{"role_id":5,"group_id":"3","parent_id":null,"role_nm":"Cafe ivy","role_desc":"Cafe ivy","mdd":null,"aktif_st":"1","default_gudang":"0","group_nama":"Cafe dan Resto","group_desc":null,"parent_name":""},{"role_id":6,"group_id":"3","parent_id":"5","role_nm":"Kasir","role_desc":"gg","mdd":null,"aktif_st":"1","default_gudang":"0","group_nama":"Cafe dan Resto","group_desc":null,"parent_name":"Cafe ivy"},{"role_id":7,"group_id":"3","parent_id":"5","role_nm":"Waiters","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"0","group_nama":"Cafe dan Resto","group_desc":null,"parent_name":"Cafe ivy"},{"role_id":8,"group_id":"3","parent_id":"5","role_nm":"Dapur","role_desc":"Dapur","mdd":null,"aktif_st":"0","default_gudang":"0","group_nama":"Cafe dan Resto","group_desc":null,"parent_name":"Cafe ivy"},{"role_id":9,"group_id":"3","parent_id":null,"role_nm":"Cafe bento","role_desc":"Cafe","mdd":null,"aktif_st":"1","default_gudang":"0","group_nama":"Cafe dan Resto","group_desc":null,"parent_name":""},{"role_id":10,"group_id":"3","parent_id":"9","role_nm":"Kasir","role_desc":"Kasir","mdd":null,"aktif_st":"0","default_gudang":"0","group_nama":"Cafe dan Resto","group_desc":null,"parent_name":"Cafe bento"},{"role_id":11,"group_id":"3","parent_id":"9","role_nm":"Waiters","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"0","group_nama":"Cafe dan Resto","group_desc":null,"parent_name":"Cafe bento"},{"role_id":12,"group_id":"3","parent_id":"9","role_nm":"Dapur","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"0","group_nama":"Cafe dan Resto","group_desc":null,"parent_name":"Cafe bento"},{"role_id":13,"group_id":"3","parent_id":"5","role_nm":"Dapur 2","role_desc":"Dapur 2","mdd":null,"aktif_st":"1","default_gudang":"0","group_nama":"Cafe dan Resto","group_desc":null,"parent_name":"Cafe ivy"}]

class ModelListRole {
  bool? _notifSt;
  String? _notifMsg;
  List<Data>? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  List<Data>? get data => _data;

  ModelListRole({
      bool? notifSt, 
      String? notifMsg, 
      List<Data>? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelListRole.fromJson(dynamic json) {
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

/// role_id : 0
/// group_id : "7"
/// parent_id : null
/// role_nm : "dapur 3"
/// role_desc : null
/// mdd : null
/// aktif_st : null
/// default_gudang : "0"
/// group_nama : "Dapur"
/// group_desc : null
/// parent_name : ""

class Data {
  int? _roleId;
  String? _groupId;
  dynamic? _parentId;
  String? _roleNm;
  dynamic? _roleDesc;
  dynamic? _mdd;
  dynamic? _aktifSt;
  String? _defaultGudang;
  String? _groupNama;
  dynamic? _groupDesc;
  String? _parentName;

  int? get roleId => _roleId;
  String? get groupId => _groupId;
  dynamic? get parentId => _parentId;
  String? get roleNm => _roleNm;
  dynamic? get roleDesc => _roleDesc;
  dynamic? get mdd => _mdd;
  dynamic? get aktifSt => _aktifSt;
  String? get defaultGudang => _defaultGudang;
  String? get groupNama => _groupNama;
  dynamic? get groupDesc => _groupDesc;
  String? get parentName => _parentName;

  Data({
      int? roleId, 
      String? groupId, 
      dynamic? parentId, 
      String? roleNm, 
      dynamic? roleDesc, 
      dynamic? mdd, 
      dynamic? aktifSt, 
      String? defaultGudang, 
      String? groupNama, 
      dynamic? groupDesc, 
      String? parentName}){
    _roleId = roleId;
    _groupId = groupId;
    _parentId = parentId;
    _roleNm = roleNm;
    _roleDesc = roleDesc;
    _mdd = mdd;
    _aktifSt = aktifSt;
    _defaultGudang = defaultGudang;
    _groupNama = groupNama;
    _groupDesc = groupDesc;
    _parentName = parentName;
}

  Data.fromJson(dynamic json) {
    _roleId = json["role_id"];
    _groupId = json["group_id"];
    _parentId = json["parent_id"];
    _roleNm = json["role_nm"];
    _roleDesc = json["role_desc"];
    _mdd = json["mdd"];
    _aktifSt = json["aktif_st"];
    _defaultGudang = json["default_gudang"];
    _groupNama = json["group_nama"];
    _groupDesc = json["group_desc"];
    _parentName = json["parent_name"];
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
    map["group_nama"] = _groupNama;
    map["group_desc"] = _groupDesc;
    map["parent_name"] = _parentName;
    return map;
  }

}