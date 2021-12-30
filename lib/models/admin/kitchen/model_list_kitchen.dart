/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : {"array_kitchen":[{"kitchen_id":1,"kitchen_nama":"kitchen edit 1","kitchen_deskripsi":"Testing"}]}

class ModelListKitchen {
  bool? _notifSt;
  String? _notifMsg;
  Data? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  Data? get data => _data;

  ModelListKitchen({
      bool? notifSt, 
      String? notifMsg, 
      Data? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelListKitchen.fromJson(dynamic json) {
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

/// array_kitchen : [{"kitchen_id":1,"kitchen_nama":"kitchen edit 1","kitchen_deskripsi":"Testing"}]

class Data {
  List<Array_kitchen>? _arrayKitchen;

  List<Array_kitchen>? get arrayKitchen => _arrayKitchen;

  Data({
      List<Array_kitchen>? arrayKitchen}){
    _arrayKitchen = arrayKitchen;
}

  Data.fromJson(dynamic json) {
    if (json["array_kitchen"] != null) {
      _arrayKitchen = [];
      json["array_kitchen"].forEach((v) {
        _arrayKitchen?.add(Array_kitchen.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arrayKitchen != null) {
      map["array_kitchen"] = _arrayKitchen?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// kitchen_id : 1
/// kitchen_nama : "kitchen edit 1"
/// kitchen_deskripsi : "Testing"

class Array_kitchen {
  int? _kitchenId;
  String? _kitchenNama;
  String? _kitchenDeskripsi;

  int? get kitchenId => _kitchenId;
  String? get kitchenNama => _kitchenNama;
  String? get kitchenDeskripsi => _kitchenDeskripsi;

  Array_kitchen({
      int? kitchenId, 
      String? kitchenNama, 
      String? kitchenDeskripsi}){
    _kitchenId = kitchenId;
    _kitchenNama = kitchenNama;
    _kitchenDeskripsi = kitchenDeskripsi;
}

  Array_kitchen.fromJson(dynamic json) {
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