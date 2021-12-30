/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"array_gudang":[{"role_id":2,"group_id":"2","parent_id":"","role_nm":"Gudang Pusat","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"1","retail_st":"0"},{"role_id":3,"group_id":"2","parent_id":"","role_nm":"Gudang Timika diana","role_desc":"Testing","mdd":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"},{"role_id":4,"group_id":"2","parent_id":"","role_nm":"Gudang Timika Yos Sudarso","role_desc":null,"mdd":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"}]}

class ModelAddStep1 {
  ModelAddStep1({
      bool? notifSt, 
      String? notifMsg, 
      Data? data,}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelAddStep1.fromJson(dynamic json) {
    _notifSt = json['notif_st'];
    _notifMsg = json['notif_msg'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notif_st'] = _notifSt;
    map['notif_msg'] = _notifMsg;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// array_gudang : [{"role_id":2,"group_id":"2","parent_id":"","role_nm":"Gudang Pusat","role_desc":null,"mdd":null,"aktif_st":"1","default_gudang":"1","retail_st":"0"},{"role_id":3,"group_id":"2","parent_id":"","role_nm":"Gudang Timika diana","role_desc":"Testing","mdd":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"},{"role_id":4,"group_id":"2","parent_id":"","role_nm":"Gudang Timika Yos Sudarso","role_desc":null,"mdd":null,"aktif_st":null,"default_gudang":"0","retail_st":"0"}]

class Data {
  Data({
      List<Array_gudang>? arrayGudang,}){
    _arrayGudang = arrayGudang;
}

  Data.fromJson(dynamic json) {
    if (json['array_gudang'] != null) {
      _arrayGudang = [];
      json['array_gudang'].forEach((v) {
        _arrayGudang?.add(Array_gudang.fromJson(v));
      });
    }
  }
  List<Array_gudang>? _arrayGudang;

  List<Array_gudang>? get arrayGudang => _arrayGudang;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_arrayGudang != null) {
      map['array_gudang'] = _arrayGudang?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// role_id : 2
/// group_id : "2"
/// parent_id : ""
/// role_nm : "Gudang Pusat"
/// role_desc : null
/// mdd : null
/// aktif_st : "1"
/// default_gudang : "1"
/// retail_st : "0"

class Array_gudang {
  Array_gudang({
      int? roleId, 
      String? groupId, 
      String? parentId, 
      String? roleNm, 
      dynamic roleDesc, 
      dynamic mdd, 
      String? aktifSt, 
      String? defaultGudang, 
      String? retailSt,}){
    _roleId = roleId;
    _groupId = groupId;
    _parentId = parentId;
    _roleNm = roleNm;
    _roleDesc = roleDesc;
    _mdd = mdd;
    _aktifSt = aktifSt;
    _defaultGudang = defaultGudang;
    _retailSt = retailSt;
}

  Array_gudang.fromJson(dynamic json) {
    _roleId = json['role_id'];
    _groupId = json['group_id'];
    _parentId = json['parent_id'];
    _roleNm = json['role_nm'];
    _roleDesc = json['role_desc'];
    _mdd = json['mdd'];
    _aktifSt = json['aktif_st'];
    _defaultGudang = json['default_gudang'];
    _retailSt = json['retail_st'];
  }
  int? _roleId;
  String? _groupId;
  String? _parentId;
  String? _roleNm;
  dynamic _roleDesc;
  dynamic _mdd;
  String? _aktifSt;
  String? _defaultGudang;
  String? _retailSt;

  int? get roleId => _roleId;
  String? get groupId => _groupId;
  String? get parentId => _parentId;
  String? get roleNm => _roleNm;
  dynamic get roleDesc => _roleDesc;
  dynamic get mdd => _mdd;
  String? get aktifSt => _aktifSt;
  String? get defaultGudang => _defaultGudang;
  String? get retailSt => _retailSt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role_id'] = _roleId;
    map['group_id'] = _groupId;
    map['parent_id'] = _parentId;
    map['role_nm'] = _roleNm;
    map['role_desc'] = _roleDesc;
    map['mdd'] = _mdd;
    map['aktif_st'] = _aktifSt;
    map['default_gudang'] = _defaultGudang;
    map['retail_st'] = _retailSt;
    return map;
  }

}