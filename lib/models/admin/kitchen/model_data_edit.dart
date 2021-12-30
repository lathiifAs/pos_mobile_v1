/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"result":{"kitchen_id":1,"kitchen_nama":"kitchen edit 1","kitchen_deskripsi":"Testing"}}

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

/// result : {"kitchen_id":1,"kitchen_nama":"kitchen edit 1","kitchen_deskripsi":"Testing"}

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

/// kitchen_id : 1
/// kitchen_nama : "kitchen edit 1"
/// kitchen_deskripsi : "Testing"

class Result {
  int? _kitchenId;
  String? _kitchenNama;
  String? _kitchenDeskripsi;

  int? get kitchenId => _kitchenId;
  String? get kitchenNama => _kitchenNama;
  String? get kitchenDeskripsi => _kitchenDeskripsi;

  Result({
      int? kitchenId, 
      String? kitchenNama, 
      String? kitchenDeskripsi}){
    _kitchenId = kitchenId;
    _kitchenNama = kitchenNama;
    _kitchenDeskripsi = kitchenDeskripsi;
}

  Result.fromJson(dynamic json) {
    _kitchenId = json["kitchen_id"];
    _kitchenNama = json["kitchen_nama"];
    _kitchenDeskripsi = json["kitchen_deskripsi"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["kitchen_id"] = _kitchenId;
    map["kitchen_nama"] = _kitchenNama;
    map["kitchen_deskripsi"] = _kitchenDeskripsi;
    return map;
  }

}