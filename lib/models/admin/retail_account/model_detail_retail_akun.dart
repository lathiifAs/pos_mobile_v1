/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"result":{"user_id":2021100122,"user_name":"kasirudin","pass_hash":"$2b$10$Fuxyc1T9DFp9YcvIkZoLPOhMbNRNO3RAp5Doay7o7aKlBXlzGHKrC","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIwMjExMDAxMjIiLCJpYXQiOjE2MzMwNTcwOTIsImV4cCI6MWUrNDF9.3MOjOlPywxTyvp7g7EqQ1HCb_7nx-4t2knMIARDJVKA","token_key":"CVimvK","mdd":"2021-09-30T17:00:00.000Z","user_st":"1","role_id":25,"nama":"Udin Aji Santoso","no_hp":"0812345456","alamat_lengkap":"Sleman","email":"kasirudin@gmail.com","tgl_lahir":"2021-10-26T17:00:00.000Z","no_nik":"321215141321231","no_npwp":"12312313213","tgl_lahir_reformat":"2021-10-27","role_nm":"Kasir Retail Timika"}}

class ModelDetailRetailAkun {
  ModelDetailRetailAkun({
      this.notifSt, 
      this.notifMsg, 
      this.data,});

  ModelDetailRetailAkun.fromJson(dynamic json) {
    notifSt = json['notif_st'];
    notifMsg = json['notif_msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? notifSt;
  String? notifMsg;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notif_st'] = notifSt;
    map['notif_msg'] = notifMsg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// result : {"user_id":2021100122,"user_name":"kasirudin","pass_hash":"$2b$10$Fuxyc1T9DFp9YcvIkZoLPOhMbNRNO3RAp5Doay7o7aKlBXlzGHKrC","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIwMjExMDAxMjIiLCJpYXQiOjE2MzMwNTcwOTIsImV4cCI6MWUrNDF9.3MOjOlPywxTyvp7g7EqQ1HCb_7nx-4t2knMIARDJVKA","token_key":"CVimvK","mdd":"2021-09-30T17:00:00.000Z","user_st":"1","role_id":25,"nama":"Udin Aji Santoso","no_hp":"0812345456","alamat_lengkap":"Sleman","email":"kasirudin@gmail.com","tgl_lahir":"2021-10-26T17:00:00.000Z","no_nik":"321215141321231","no_npwp":"12312313213","tgl_lahir_reformat":"2021-10-27","role_nm":"Kasir Retail Timika"}

class Data {
  Data({
      this.result,});

  Data.fromJson(dynamic json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }

}

/// user_id : 2021100122
/// user_name : "kasirudin"
/// pass_hash : "$2b$10$Fuxyc1T9DFp9YcvIkZoLPOhMbNRNO3RAp5Doay7o7aKlBXlzGHKrC"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIwMjExMDAxMjIiLCJpYXQiOjE2MzMwNTcwOTIsImV4cCI6MWUrNDF9.3MOjOlPywxTyvp7g7EqQ1HCb_7nx-4t2knMIARDJVKA"
/// token_key : "CVimvK"
/// mdd : "2021-09-30T17:00:00.000Z"
/// user_st : "1"
/// role_id : 25
/// nama : "Udin Aji Santoso"
/// no_hp : "0812345456"
/// alamat_lengkap : "Sleman"
/// email : "kasirudin@gmail.com"
/// tgl_lahir : "2021-10-26T17:00:00.000Z"
/// no_nik : "321215141321231"
/// no_npwp : "12312313213"
/// tgl_lahir_reformat : "2021-10-27"
/// role_nm : "Kasir Retail Timika"

class Result {
  Result({
      this.userId, 
      this.userName, 
      this.passHash, 
      this.token, 
      this.tokenKey, 
      this.mdd, 
      this.userSt, 
      this.roleId, 
      this.nama, 
      this.noHp, 
      this.alamatLengkap, 
      this.email, 
      this.tglLahir, 
      this.noNik, 
      this.noNpwp, 
      this.tglLahirReformat, 
      this.roleNm,});

  Result.fromJson(dynamic json) {
    userId = json['user_id'];
    userName = json['user_name'];
    passHash = json['pass_hash'];
    token = json['token'];
    tokenKey = json['token_key'];
    mdd = json['mdd'];
    userSt = json['user_st'];
    roleId = json['role_id'];
    nama = json['nama'];
    noHp = json['no_hp'];
    alamatLengkap = json['alamat_lengkap'];
    email = json['email'];
    tglLahir = json['tgl_lahir'];
    noNik = json['no_nik'];
    noNpwp = json['no_npwp'];
    tglLahirReformat = json['tgl_lahir_reformat'];
    roleNm = json['role_nm'];
  }
  int? userId;
  String? userName;
  String? passHash;
  String? token;
  String? tokenKey;
  String? mdd;
  String? userSt;
  int? roleId;
  String? nama;
  String? noHp;
  String? alamatLengkap;
  String? email;
  String? tglLahir;
  String? noNik;
  String? noNpwp;
  String? tglLahirReformat;
  String? roleNm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['user_name'] = userName;
    map['pass_hash'] = passHash;
    map['token'] = token;
    map['token_key'] = tokenKey;
    map['mdd'] = mdd;
    map['user_st'] = userSt;
    map['role_id'] = roleId;
    map['nama'] = nama;
    map['no_hp'] = noHp;
    map['alamat_lengkap'] = alamatLengkap;
    map['email'] = email;
    map['tgl_lahir'] = tglLahir;
    map['no_nik'] = noNik;
    map['no_npwp'] = noNpwp;
    map['tgl_lahir_reformat'] = tglLahirReformat;
    map['role_nm'] = roleNm;
    return map;
  }

}