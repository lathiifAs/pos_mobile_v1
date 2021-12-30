/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : [{"array_satuan":[{"pref_id":1,"pref_group":"ppn","pref_nm":"PPN","pref_label":"presentase_ppn","pref_value":"10"},{"pref_id":2,"pref_group":"service","pref_nm":"Services","pref_label":"presentase_service","pref_value":"0"}]}]

class ModelIndexPref {
  bool? _notifSt;
  String? _notifMsg;
  List<Data>? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  List<Data>? get data => _data;

  ModelIndexPref({
      bool? notifSt, 
      String? notifMsg, 
      List<Data>? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelIndexPref.fromJson(dynamic json) {
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

/// array_satuan : [{"pref_id":1,"pref_group":"ppn","pref_nm":"PPN","pref_label":"presentase_ppn","pref_value":"10"},{"pref_id":2,"pref_group":"service","pref_nm":"Services","pref_label":"presentase_service","pref_value":"0"}]

class Data {
  List<Array_satuan>? _arraySatuan;

  List<Array_satuan>? get arraySatuan => _arraySatuan;

  Data({
      List<Array_satuan>? arraySatuan}){
    _arraySatuan = arraySatuan;
}

  Data.fromJson(dynamic json) {
    if (json["array_satuan"] != null) {
      _arraySatuan = [];
      json["array_satuan"].forEach((v) {
        _arraySatuan?.add(Array_satuan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arraySatuan != null) {
      map["array_satuan"] = _arraySatuan?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// pref_id : 1
/// pref_group : "ppn"
/// pref_nm : "PPN"
/// pref_label : "presentase_ppn"
/// pref_value : "10"

class Array_satuan {
  int? _prefId;
  String? _prefGroup;
  String? _prefNm;
  String? _prefLabel;
  String? _prefValue;

  int? get prefId => _prefId;
  String? get prefGroup => _prefGroup;
  String? get prefNm => _prefNm;
  String? get prefLabel => _prefLabel;
  String? get prefValue => _prefValue;

  Array_satuan({
      int? prefId, 
      String? prefGroup, 
      String? prefNm, 
      String? prefLabel, 
      String? prefValue}){
    _prefId = prefId;
    _prefGroup = prefGroup;
    _prefNm = prefNm;
    _prefLabel = prefLabel;
    _prefValue = prefValue;
}

  Array_satuan.fromJson(dynamic json) {
    _prefId = json["pref_id"];
    _prefGroup = json["pref_group"];
    _prefNm = json["pref_nm"];
    _prefLabel = json["pref_label"];
    _prefValue = json["pref_value"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["pref_id"] = _prefId;
    map["pref_group"] = _prefGroup;
    map["pref_nm"] = _prefNm;
    map["pref_label"] = _prefLabel;
    map["pref_value"] = _prefValue;
    return map;
  }

}