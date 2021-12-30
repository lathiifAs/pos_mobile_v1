/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"result":{"sales_group_id":4,"group_id":"3","sales_group_nama":"Tes Kategori 2","sales_group_desc":"Tes","aktif_st":"1","group_nama":"Cafe dan Resto"}}

class ModelDataEdit {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelDataEdit({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelDataEdit.fromJson(dynamic json) {
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

/// result : {"sales_group_id":4,"group_id":"3","sales_group_nama":"Tes Kategori 2","sales_group_desc":"Tes","aktif_st":"1","group_nama":"Cafe dan Resto"}

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

/// sales_group_id : 4
/// group_id : "3"
/// sales_group_nama : "Tes Kategori 2"
/// sales_group_desc : "Tes"
/// aktif_st : "1"
/// group_nama : "Cafe dan Resto"

class Result {
  int? _salesGroupId;
  String? _groupId;
  String? _salesGroupNama;
  String? _salesGroupDesc;
  String? _aktifSt;
  String? _groupNama;

  int? get salesGroupId => _salesGroupId;
  String? get groupId => _groupId;
  String? get salesGroupNama => _salesGroupNama;
  String? get salesGroupDesc => _salesGroupDesc;
  String? get aktifSt => _aktifSt;
  String? get groupNama => _groupNama;

  Result({
      int? salesGroupId, 
      String? groupId, 
      String? salesGroupNama, 
      String? salesGroupDesc, 
      String? aktifSt, 
      String? groupNama}){
    _salesGroupId = salesGroupId;
    _groupId = groupId;
    _salesGroupNama = salesGroupNama;
    _salesGroupDesc = salesGroupDesc;
    _aktifSt = aktifSt;
    _groupNama = groupNama;
}

  Result.fromJson(dynamic json) {
    _salesGroupId = json["sales_group_id"];
    _groupId = json["group_id"];
    _salesGroupNama = json["sales_group_nama"];
    _salesGroupDesc = json["sales_group_desc"];
    _aktifSt = json["aktif_st"];
    _groupNama = json["group_nama"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["sales_group_id"] = _salesGroupId;
    map["group_id"] = _groupId;
    map["sales_group_nama"] = _salesGroupNama;
    map["sales_group_desc"] = _salesGroupDesc;
    map["aktif_st"] = _aktifSt;
    map["group_nama"] = _groupNama;
    return map;
  }

}