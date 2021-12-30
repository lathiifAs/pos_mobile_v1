/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : [{"array_akun":[{"user_id":2021100121,"user_name":"testing_akun_cafe","user_st":"1","role_id":25,"nama":"testing_akun_cafe","no_hp":"081982983210","alamat_lengkap":"karangsong","role_nm":"Kasir Retail Timika"},{"user_id":2021100122,"user_name":"kasirudin","user_st":"1","role_id":25,"nama":"Udin Aji Santoso","no_hp":"0812345456","alamat_lengkap":"Sleman","role_nm":"Kasir Retail Timika"}]}]

class ModelListAkunByRetail {
  ModelListAkunByRetail({
      this.notifSt, 
      this.notifMsg, 
      this.data,});

  ModelListAkunByRetail.fromJson(dynamic json) {
    notifSt = json['notif_st'];
    notifMsg = json['notif_msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? notifSt;
  String? notifMsg;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notif_st'] = notifSt;
    map['notif_msg'] = notifMsg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// array_akun : [{"user_id":2021100121,"user_name":"testing_akun_cafe","user_st":"1","role_id":25,"nama":"testing_akun_cafe","no_hp":"081982983210","alamat_lengkap":"karangsong","role_nm":"Kasir Retail Timika"},{"user_id":2021100122,"user_name":"kasirudin","user_st":"1","role_id":25,"nama":"Udin Aji Santoso","no_hp":"0812345456","alamat_lengkap":"Sleman","role_nm":"Kasir Retail Timika"}]

class Data {
  Data({
      this.arrayAkun,});

  Data.fromJson(dynamic json) {
    if (json['array_akun'] != null) {
      arrayAkun = [];
      json['array_akun'].forEach((v) {
        arrayAkun?.add(Array_akun.fromJson(v));
      });
    }
  }
  List<Array_akun>? arrayAkun;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (arrayAkun != null) {
      map['array_akun'] = arrayAkun?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// user_id : 2021100121
/// user_name : "testing_akun_cafe"
/// user_st : "1"
/// role_id : 25
/// nama : "testing_akun_cafe"
/// no_hp : "081982983210"
/// alamat_lengkap : "karangsong"
/// role_nm : "Kasir Retail Timika"

class Array_akun {
  Array_akun({
      this.userId, 
      this.userName, 
      this.userSt, 
      this.roleId, 
      this.nama, 
      this.noHp, 
      this.alamatLengkap, 
      this.roleNm,});

  Array_akun.fromJson(dynamic json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userSt = json['user_st'];
    roleId = json['role_id'];
    nama = json['nama'];
    noHp = json['no_hp'];
    alamatLengkap = json['alamat_lengkap'];
    roleNm = json['role_nm'];
  }
  int? userId;
  String? userName;
  String? userSt;
  int? roleId;
  String? nama;
  String? noHp;
  String? alamatLengkap;
  String? roleNm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['user_name'] = userName;
    map['user_st'] = userSt;
    map['role_id'] = roleId;
    map['nama'] = nama;
    map['no_hp'] = noHp;
    map['alamat_lengkap'] = alamatLengkap;
    map['role_nm'] = roleNm;
    return map;
  }

}