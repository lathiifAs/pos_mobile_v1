/// notif_st : true
/// notif_msg : "Berhasil mengambil data."
/// data : [{"array_sales_group":[{"sales_group_id":3,"group_id":"2","sales_group_nama":"Kategori Edit","sales_group_desc":"Testing","aktif_st":"1","group_nama":"Gudang"},{"sales_group_id":4,"group_id":"3","sales_group_nama":"Tes Kategori 2","sales_group_desc":"Tes","aktif_st":"1","group_nama":"Cafe dan Resto"}]}]

class ModelSalesGroup {
  bool? _notifSt;
  String? _notifMsg;
  List<Data>? _data;

  bool? get notifSt => _notifSt;
  String? get notifMsg => _notifMsg;
  List<Data>? get data => _data;

  ModelSalesGroup({
      bool? notifSt, 
      String? notifMsg, 
      List<Data>? data}){
    _notifSt = notifSt;
    _notifMsg = notifMsg;
    _data = data;
}

  ModelSalesGroup.fromJson(dynamic json) {
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

/// array_sales_group : [{"sales_group_id":3,"group_id":"2","sales_group_nama":"Kategori Edit","sales_group_desc":"Testing","aktif_st":"1","group_nama":"Gudang"},{"sales_group_id":4,"group_id":"3","sales_group_nama":"Tes Kategori 2","sales_group_desc":"Tes","aktif_st":"1","group_nama":"Cafe dan Resto"}]

class Data {
  List<Array_sales_group>? _arraySalesGroup;

  List<Array_sales_group>? get arraySalesGroup => _arraySalesGroup;

  Data({
      List<Array_sales_group>? arraySalesGroup}){
    _arraySalesGroup = arraySalesGroup;
}

  Data.fromJson(dynamic json) {
    if (json["array_sales_group"] != null) {
      _arraySalesGroup = [];
      json["array_sales_group"].forEach((v) {
        _arraySalesGroup?.add(Array_sales_group.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arraySalesGroup != null) {
      map["array_sales_group"] = _arraySalesGroup?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// sales_group_id : 3
/// group_id : "2"
/// sales_group_nama : "Kategori Edit"
/// sales_group_desc : "Testing"
/// aktif_st : "1"
/// group_nama : "Gudang"

class Array_sales_group {
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

  Array_sales_group({
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

  Array_sales_group.fromJson(dynamic json) {
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