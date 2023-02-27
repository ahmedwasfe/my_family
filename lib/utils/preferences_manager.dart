
import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_family/model/auth/other_auth.dart';
import 'package:my_family/model/children/child.dart';
import 'package:my_family/model/helper/helper.dart';
import 'package:my_family/model/parent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager extends GetxService{
  static late SharedPreferences _sharedPreferences;

  Future<PreferencesManager> initial() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  static dynamic getAppData({required String key}) {
    return _sharedPreferences.get(key);
  }

  static Future<dynamic> saveAppData(
      {required key, required dynamic value}) async {
    if (value is String) return await _sharedPreferences.setString(key, value);
    if (value is int) return await _sharedPreferences.setInt(key, value);
    if (value is bool) return await _sharedPreferences.setBool(key, value);
    if (value is double) return await _sharedPreferences.setDouble(key, value);
  }

  static Future<bool> saveAppTheme(
      {required key, required String theme}) async {
    return await _sharedPreferences.setString(key, theme);
  }

  static dynamic getAppTheme({required String key}) {
    return _sharedPreferences.get(key);
  }

  static Future<bool> saveAppLanguage(
      {required key, required String languageCode}) async {
    return await _sharedPreferences.setString(key, languageCode);
  }

  static dynamic getAppLanguage({required String key}) {
    return _sharedPreferences.get(key);
  }


  static Future<bool> saveUserToken(
      {required key, required String token}) async {
    return await _sharedPreferences.setString(key, token);
  }

  static dynamic getUserToken({required String key}) {
    return _sharedPreferences.get(key);
  }

  static Future<dynamic> saveParentData(
      {required String key, required Parent user}) async {
    return await _sharedPreferences.setString(key, jsonEncode(user));
  }

  static Future<dynamic> saveOtherUserData(
      {required String key, required OtherUser user}) async {
    return await _sharedPreferences.setString(key, jsonEncode(user));
  }

  static Parent getParentData({required String key}) {
    Parent user = Parent();
    String? userDataJson = _sharedPreferences.getString(key);
    if (userDataJson != null) {
      user = Parent.fromJson(jsonDecode(userDataJson));
    }
    return user;
  }

  static OtherUser getOtherUserData({required String key}) {
    OtherUser user = OtherUser();
    String? userDataJson = _sharedPreferences.getString(key);
    if (userDataJson != null) {
      user = OtherUser.fromJson(jsonDecode(userDataJson));
    }
    return user;
  }

  static Future<bool> clearData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  static Future<bool> clearAllData() async {
    return await _sharedPreferences.clear();
  }
}