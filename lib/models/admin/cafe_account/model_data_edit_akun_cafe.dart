/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"result":{"user_id":2021080612,"user_name":"ydyfu","pass_hash":"$2b$10$uGCFC9sf0Mcgbl./2R4ltOhUSPYrUDzq0l7eB010MdJwNWvLy2x8u","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIwMjEwODA2MTIiLCJpYXQiOjE2MjgyNDQ4NDIsImV4cCI6MWUrNDF9.K9PpnegC7QJnHTHCziShc2KTMR1wwitBqp4lguzb39M","token_key":"ZOz2bv","mdd":"2021-08-05T17:00:00.000Z","user_st":"1","role_id":10,"nama":"bcbc","no_hp":"865356","alamat_lengkap":"xhchj","email":"jccjg","tgl_lahir":"2021-08-02T17:00:00.000Z","no_nik":"6865656","no_npwp":"6565635","tgl_lahir_reformat":"2021-08-03","role_nm":"Kasir"}}

class ModelDataEditAkunCafe {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelDataEditAkunCafe({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelDataEditAkunCafe.fromJson(dynamic json) {
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

/// result : {"user_id":2021080612,"user_name":"ydyfu","pass_hash":"$2b$10$uGCFC9sf0Mcgbl./2R4ltOhUSPYrUDzq0l7eB010MdJwNWvLy2x8u","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIwMjEwODA2MTIiLCJpYXQiOjE2MjgyNDQ4NDIsImV4cCI6MWUrNDF9.K9PpnegC7QJnHTHCziShc2KTMR1wwitBqp4lguzb39M","token_key":"ZOz2bv","mdd":"2021-08-05T17:00:00.000Z","user_st":"1","role_id":10,"nama":"bcbc","no_hp":"865356","alamat_lengkap":"xhchj","email":"jccjg","tgl_lahir":"2021-08-02T17:00:00.000Z","no_nik":"6865656","no_npwp":"6565635","tgl_lahir_reformat":"2021-08-03","role_nm":"Kasir"}

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

/// user_id : 2021080612
/// user_name : "ydyfu"
/// pass_hash : "$2b$10$uGCFC9sf0Mcgbl./2R4ltOhUSPYrUDzq0l7eB010MdJwNWvLy2x8u"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIwMjEwODA2MTIiLCJpYXQiOjE2MjgyNDQ4NDIsImV4cCI6MWUrNDF9.K9PpnegC7QJnHTHCziShc2KTMR1wwitBqp4lguzb39M"
/// token_key : "ZOz2bv"
/// mdd : "2021-08-05T17:00:00.000Z"
/// user_st : "1"
/// role_id : 10
/// nama : "bcbc"
/// no_hp : "865356"
/// alamat_lengkap : "xhchj"
/// email : "jccjg"
/// tgl_lahir : "2021-08-02T17:00:00.000Z"
/// no_nik : "6865656"
/// no_npwp : "6565635"
/// tgl_lahir_reformat : "2021-08-03"
/// role_nm : "Kasir"

class Result {
  int? _userId;
  String? _userName;
  String? _passHash;
  String? _token;
  String? _tokenKey;
  String? _mdd;
  String? _userSt;
  int? _roleId;
  String? _nama;
  String? _noHp;
  String? _alamatLengkap;
  String? _email;
  String? _tglLahir;
  String? _noNik;
  String? _noNpwp;
  String? _tglLahirReformat;
  String? _roleNm;

  int? get userId => _userId;
  String? get userName => _userName;
  String? get passHash => _passHash;
  String? get token => _token;
  String? get tokenKey => _tokenKey;
  String? get mdd => _mdd;
  String? get userSt => _userSt;
  int? get roleId => _roleId;
  String? get nama => _nama;
  String? get noHp => _noHp;
  String? get alamatLengkap => _alamatLengkap;
  String? get email => _email;
  String? get tglLahir => _tglLahir;
  String? get noNik => _noNik;
  String? get noNpwp => _noNpwp;
  String? get tglLahirReformat => _tglLahirReformat;
  String? get roleNm => _roleNm;

  Result({
      int? userId, 
      String? userName, 
      String? passHash, 
      String? token, 
      String? tokenKey, 
      String? mdd, 
      String? userSt, 
      int? roleId, 
      String? nama, 
      String? noHp, 
      String? alamatLengkap, 
      String? email, 
      String? tglLahir, 
      String? noNik, 
      String? noNpwp, 
      String? tglLahirReformat, 
      String? roleNm}){
    _userId = userId;
    _userName = userName;
    _passHash = passHash;
    _token = token;
    _tokenKey = tokenKey;
    _mdd = mdd;
    _userSt = userSt;
    _roleId = roleId;
    _nama = nama;
    _noHp = noHp;
    _alamatLengkap = alamatLengkap;
    _email = email;
    _tglLahir = tglLahir;
    _noNik = noNik;
    _noNpwp = noNpwp;
    _tglLahirReformat = tglLahirReformat;
    _roleNm = roleNm;
}

  Result.fromJson(dynamic json) {
    _userId = json["user_id"];
    _userName = json["user_name"];
    _passHash = json["pass_hash"];
    _token = json["token"];
    _tokenKey = json["token_key"];
    _mdd = json["mdd"];
    _userSt = json["user_st"];
    _roleId = json["role_id"];
    _nama = json["nama"];
    _noHp = json["no_hp"];
    _alamatLengkap = json["alamat_lengkap"];
    _email = json["email"];
    _tglLahir = json["tgl_lahir"];
    _noNik = json["no_nik"];
    _noNpwp = json["no_npwp"];
    _tglLahirReformat = json["tgl_lahir_reformat"];
    _roleNm = json["role_nm"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["user_id"] = _userId;
    map["user_name"] = _userName;
    map["pass_hash"] = _passHash;
    map["token"] = _token;
    map["token_key"] = _tokenKey;
    map["mdd"] = _mdd;
    map["user_st"] = _userSt;
    map["role_id"] = _roleId;
    map["nama"] = _nama;
    map["no_hp"] = _noHp;
    map["alamat_lengkap"] = _alamatLengkap;
    map["email"] = _email;
    map["tgl_lahir"] = _tglLahir;
    map["no_nik"] = _noNik;
    map["no_npwp"] = _noNpwp;
    map["tgl_lahir_reformat"] = _tglLahirReformat;
    map["role_nm"] = _roleNm;
    return map;
  }

}