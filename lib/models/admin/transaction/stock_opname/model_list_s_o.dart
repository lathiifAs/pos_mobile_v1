/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"array_opname":[{"opname_id":5,"tanggal":"2021-09-25T15:49:18.000Z","keterangan":"testing","role_id":3,"role_nm":"Gudang Timika diana"}]}

class ModelListSO {
  ModelListSO({
      bool? notifSt, 
      String? notifMsg, 
      Data? data,}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelListSO.fromJson(dynamic json) {
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

/// array_opname : [{"opname_id":5,"tanggal":"2021-09-25T15:49:18.000Z","keterangan":"testing","role_id":3,"role_nm":"Gudang Timika diana"}]

class Data {
  Data({
      List<Array_opname>? arrayOpname,}){
    _arrayOpname = arrayOpname;
}

  Data.fromJson(dynamic json) {
    if (json['array_opname'] != null) {
      _arrayOpname = [];
      json['array_opname'].forEach((v) {
        _arrayOpname?.add(Array_opname.fromJson(v));
      });
    }
  }
  List<Array_opname>? _arrayOpname;

  List<Array_opname>? get arrayOpname => _arrayOpname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_arrayOpname != null) {
      map['array_opname'] = _arrayOpname?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// opname_id : 5
/// tanggal : "2021-09-25T15:49:18.000Z"
/// keterangan : "testing"
/// role_id : 3
/// role_nm : "Gudang Timika diana"

class Array_opname {
  Array_opname({
      int? opnameId, 
      String? tanggal, 
      String? keterangan, 
      int? roleId, 
      String? roleNm,}){
    _opnameId = opnameId;
    _tanggal = tanggal;
    _keterangan = keterangan;
    _roleId = roleId;
    _roleNm = roleNm;
}

  Array_opname.fromJson(dynamic json) {
    _opnameId = json['opname_id'];
    _tanggal = json['tanggal'];
    _keterangan = json['keterangan'];
    _roleId = json['role_id'];
    _roleNm = json['role_nm'];
  }
  int? _opnameId;
  String? _tanggal;
  String? _keterangan;
  int? _roleId;
  String? _roleNm;

  int? get opnameId => _opnameId;
  String? get tanggal => _tanggal;
  String? get keterangan => _keterangan;
  int? get roleId => _roleId;
  String? get roleNm => _roleNm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['opname_id'] = _opnameId;
    map['tanggal'] = _tanggal;
    map['keterangan'] = _keterangan;
    map['role_id'] = _roleId;
    map['role_nm'] = _roleNm;
    return map;
  }

}