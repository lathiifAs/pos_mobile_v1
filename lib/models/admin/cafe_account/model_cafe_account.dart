/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : [{"array_akun":[{"user_id":202108067,"user_name":"testing_akun_cafe","user_st":"1","role_id":19,"nama":"testing_akun_cafe","no_hp":"081982983210","alamat_lengkap":"karangsong","role_nm":"kasir"},{"user_id":202108068,"user_name":"testing_akun_cafe","user_st":"1","role_id":19,"nama":"testing_akun_cafe","no_hp":"081982983210","alamat_lengkap":"karangsong","role_nm":"kasir"}]}]

class ModelCafeAccount {
  bool? _notifSt;
  String? _notifMsg;
  List<Data>? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  List<Data>? get data => _data;

  ModelCafeAccount({
      bool? notifSt, 
      String? notifMsg, 
      List<Data>? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelCafeAccount.fromJson(dynamic json) {
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

/// array_akun : [{"user_id":202108067,"user_name":"testing_akun_cafe","user_st":"1","role_id":19,"nama":"testing_akun_cafe","no_hp":"081982983210","alamat_lengkap":"karangsong","role_nm":"kasir"},{"user_id":202108068,"user_name":"testing_akun_cafe","user_st":"1","role_id":19,"nama":"testing_akun_cafe","no_hp":"081982983210","alamat_lengkap":"karangsong","role_nm":"kasir"}]

class Data {
  List<Array_akun>? _arrayAkun;

  List<Array_akun>? get arrayAkun => _arrayAkun;

  Data({
      List<Array_akun>? arrayAkun}){
    _arrayAkun = arrayAkun;
}

  Data.fromJson(dynamic json) {
    if (json["array_akun"] != null) {
      _arrayAkun = [];
      json["array_akun"].forEach((v) {
        _arrayAkun?.add(Array_akun.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayAkun != null) {
      map["array_akun"] = _arrayAkun?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// user_id : 202108067
/// user_name : "testing_akun_cafe"
/// user_st : "1"
/// role_id : 19
/// nama : "testing_akun_cafe"
/// no_hp : "081982983210"
/// alamat_lengkap : "karangsong"
/// role_nm : "kasir"

class Array_akun {
  int? _userId;
  String? _userName;
  String? _userSt;
  int? _roleId;
  String? _nama;
  String? _noHp;
  String? _alamatLengkap;
  String? _roleNm;

  int? get userId => _userId;
  String? get userName => _userName;
  String? get userSt => _userSt;
  int? get roleId => _roleId;
  String? get nama => _nama;
  String? get noHp => _noHp;
  String? get alamatLengkap => _alamatLengkap;
  String? get roleNm => _roleNm;

  Array_akun({
      int? userId, 
      String? userName, 
      String? userSt, 
      int? roleId, 
      String? nama, 
      String? noHp, 
      String? alamatLengkap, 
      String? roleNm}){
    _userId = userId;
    _userName = userName;
    _userSt = userSt;
    _roleId = roleId;
    _nama = nama;
    _noHp = noHp;
    _alamatLengkap = alamatLengkap;
    _roleNm = roleNm;
}

  Array_akun.fromJson(dynamic json) {
    _userId = json["user_id"];
    _userName = json["user_name"];
    _userSt = json["user_st"];
    _roleId = json["role_id"];
    _nama = json["nama"];
    _noHp = json["no_hp"];
    _alamatLengkap = json["alamat_lengkap"];
    _roleNm = json["role_nm"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["user_id"] = _userId;
    map["user_name"] = _userName;
    map["user_st"] = _userSt;
    map["role_id"] = _roleId;
    map["nama"] = _nama;
    map["no_hp"] = _noHp;
    map["alamat_lengkap"] = _alamatLengkap;
    map["role_nm"] = _roleNm;
    return map;
  }

}