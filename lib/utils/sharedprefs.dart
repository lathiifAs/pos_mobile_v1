import 'package:shared_preferences/shared_preferences.dart';

var _userId = "user_id";
var _roleId = "role_id";
var _groupId = "group_id";
var _token = "token";
var _tokenKey = "token_key";
var _nama = "nama";
var _parentId = "parent_id";
var _kitchenId = "kitchen_id";

Future<SharedPreferences> preferences = SharedPreferences.getInstance();

Future getUserId() async {
  final SharedPreferences pref = await preferences;
  return pref.get(_userId);
}

Future setUserId(var value) async {
  final SharedPreferences pref = await preferences;
  return pref.setInt(_userId, value);
}

removeUserId() async {
  final SharedPreferences pref = await preferences;
  return pref.remove(_userId);
}

Future getRoleId() async {
  final SharedPreferences pref = await preferences;
  return pref.get(_roleId);
}

Future setRoleId(var value) async {
  final SharedPreferences pref = await preferences;
  return pref.setInt(_roleId, value);
}

removeRoleId() async {
  final SharedPreferences pref = await preferences;
  return pref.remove(_roleId);
}

Future getGroupId() async {
  final SharedPreferences pref = await preferences;
  return pref.get(_groupId);
}

Future setGroupId(var value) async {
  final SharedPreferences pref = await preferences;
  return pref.setString(_groupId, value);
}

removeGroupId() async {
  final SharedPreferences pref = await preferences;
  return pref.remove(_groupId);
}

// token
Future getToken() async {
  final SharedPreferences pref = await preferences;
  return pref.get(_token);
}

Future setToken(var value) async {
  final SharedPreferences pref = await preferences;
  return pref.setString(_token, value);
}

removeToken() async {
  final SharedPreferences pref = await preferences;
  return pref.remove(_token);
}

// token key
Future getTokenKey() async {
  final SharedPreferences pref = await preferences;
  return pref.get(_tokenKey);
}

Future setTokenKey(var value) async {
  final SharedPreferences pref = await preferences;
  return pref.setString(_tokenKey, value);
}

removeTokenKey() async {
  final SharedPreferences pref = await preferences;
  return pref.remove(_tokenKey);
}

// nama
Future getNama() async {
  final SharedPreferences pref = await preferences;
  return pref.get(_nama);
}

Future setNama(var value) async {
  final SharedPreferences pref = await preferences;
  return pref.setString(_nama, value);
}

removeNama() async {
  final SharedPreferences pref = await preferences;
  return pref.remove(_nama);
}

Future getParentId() async {
  final SharedPreferences pref = await preferences;
  return pref.get(_parentId);
}

Future setParentId(var value) async {
  final SharedPreferences pref = await preferences;
  return pref.setString(_parentId, value ?? null);
}

removeParentId() async {
  final SharedPreferences pref = await preferences;
  return pref.remove(_parentId);
}

Future getKitchenId() async {
  final SharedPreferences pref = await preferences;
  return pref.get(_kitchenId);
}

Future setKitchenId(var value) async {
  final SharedPreferences pref = await preferences;
  return pref.setInt(_kitchenId, value ?? null);
}

removeKitchenId() async {
  final SharedPreferences pref = await preferences;
  return pref.remove(_kitchenId);
}
