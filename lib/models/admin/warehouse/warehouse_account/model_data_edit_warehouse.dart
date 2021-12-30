/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"array_gudang":[{"role_id":2,"group_id":"2","parent_id":"","role_nm":"Gudang Pusat","role_desc":"null","mdd":null,"aktif_st":"1","default_gudang":"1"},{"role_id":3,"group_id":"2","parent_id":"","role_nm":"Gudang Timika diana","role_desc":"Testing","mdd":null,"aktif_st":null,"default_gudang":"0"},{"role_id":4,"group_id":"2","parent_id":"","role_nm":"Gudang Timika Yos Sudarso","role_desc":"null","mdd":null,"aktif_st":null,"default_gudang":"0"}],"result":{"user_id":202107271,"user_name":"akungudang1","pass_hash":"$2b$10$oE8cp1DWyystyq94RMHuA.8ykoE.QkS4HRDsrUecrF/xHee9dXdj.","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIwMjEwNzI3MSIsImlhdCI6MTYyNzM5NzYyNiwiZXhwIjoxZSs0MX0.3VABNrQxgZoCCMhtTSHTLWnHMFMTG0BPS7SoQHbkO9w","token_key":"Iyr4mV","mdd":"2021-07-26T17:00:00.000Z","user_st":"1","role_id":3,"nama":"akun gudang 1","no_hp":"2147483647","alamat_lengkap":"indramayu karangsong","email":"admintesting@gmail.com","tgl_lahir":"2021-01-26T17:00:00.000Z","no_nik":"112342342342","no_npwp":"11123321313","tgl_lahir_reformat":"2021-01-27","role_nm":"Gudang Timika diana"}}

class ModelDataEditWarehouse {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelDataEditWarehouse({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelDataEditWarehouse.fromJson(dynamic json) {
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

/// array_gudang : [{"role_id":2,"group_id":"2","parent_id":"","role_nm":"Gudang Pusat","role_desc":"null","mdd":null,"aktif_st":"1","default_gudang":"1"},{"role_id":3,"group_id":"2","parent_id":"","role_nm":"Gudang Timika diana","role_desc":"Testing","mdd":null,"aktif_st":null,"default_gudang":"0"},{"role_id":4,"group_id":"2","parent_id":"","role_nm":"Gudang Timika Yos Sudarso","role_desc":"null","mdd":null,"aktif_st":null,"default_gudang":"0"}]
/// result : {"user_id":202107271,"user_name":"akungudang1","pass_hash":"$2b$10$oE8cp1DWyystyq94RMHuA.8ykoE.QkS4HRDsrUecrF/xHee9dXdj.","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIwMjEwNzI3MSIsImlhdCI6MTYyNzM5NzYyNiwiZXhwIjoxZSs0MX0.3VABNrQxgZoCCMhtTSHTLWnHMFMTG0BPS7SoQHbkO9w","token_key":"Iyr4mV","mdd":"2021-07-26T17:00:00.000Z","user_st":"1","role_id":3,"nama":"akun gudang 1","no_hp":"2147483647","alamat_lengkap":"indramayu karangsong","email":"admintesting@gmail.com","tgl_lahir":"2021-01-26T17:00:00.000Z","no_nik":"112342342342","no_npwp":"11123321313","tgl_lahir_reformat":"2021-01-27","role_nm":"Gudang Timika diana"}

class Data {
  List<Array_gudang>? _arrayGudang;
  Result? _result;

  List<Array_gudang>? get arrayGudang => _arrayGudang;
  Result? get result => _result;

  Data({
      List<Array_gudang>? arrayGudang, 
      Result? result}){
    _arrayGudang = arrayGudang;
    _result = result;
}

  Data.fromJson(dynamic json) {
    if (json["array_gudang"] != null) {
      _arrayGudang = [];
      json["array_gudang"].forEach((v) {
        _arrayGudang?.add(Array_gudang.fromJson(v));
      });
    }
    _result = json["result"] != null ? Result.fromJson(json["result"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayGudang != null) {
      map["array_gudang"] = _arrayGudang?.map((v) => v.toJson()).toList();
    }
    if (_result != null) {
      map["result"] = _result?.toJson();
    }
    return map;
  }

}

/// user_id : 202107271
/// user_name : "akungudang1"
/// pass_hash : "$2b$10$oE8cp1DWyystyq94RMHuA.8ykoE.QkS4HRDsrUecrF/xHee9dXdj."
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIwMjEwNzI3MSIsImlhdCI6MTYyNzM5NzYyNiwiZXhwIjoxZSs0MX0.3VABNrQxgZoCCMhtTSHTLWnHMFMTG0BPS7SoQHbkO9w"
/// token_key : "Iyr4mV"
/// mdd : "2021-07-26T17:00:00.000Z"
/// user_st : "1"
/// role_id : 3
/// nama : "akun gudang 1"
/// no_hp : "2147483647"
/// alamat_lengkap : "indramayu karangsong"
/// email : "admintesting@gmail.com"
/// tgl_lahir : "2021-01-26T17:00:00.000Z"
/// no_nik : "112342342342"
/// no_npwp : "11123321313"
/// tgl_lahir_reformat : "2021-01-27"
/// role_nm : "Gudang Timika diana"

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

/// role_id : 2
/// group_id : "2"
/// parent_id : ""
/// role_nm : "Gudang Pusat"
/// role_desc : "null"
/// mdd : null
/// aktif_st : "1"
/// default_gudang : "1"

class Array_gudang {
  int? _roleId;
  String? _groupId;
  String? _parentId;
  String? _roleNm;
  String? _roleDesc;
  dynamic? _mdd;
  String? _aktifSt;
  String? _defaultGudang;

  int? get roleId => _roleId;
  String? get groupId => _groupId;
  String? get parentId => _parentId;
  String? get roleNm => _roleNm;
  String? get roleDesc => _roleDesc;
  dynamic? get mdd => _mdd;
  String? get aktifSt => _aktifSt;
  String? get defaultGudang => _defaultGudang;

  Array_gudang({
      int? roleId, 
      String? groupId, 
      String? parentId, 
      String? roleNm, 
      String? roleDesc, 
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