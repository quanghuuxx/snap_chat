import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  bool? _didInit;
  late SharedPreferences _preferences;

  SharedPreferencesService._internal();

  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return _instance;
  }

  FutureOr<void> init() async {
    if (_didInit == true) return;
    _preferences = await SharedPreferences.getInstance();
    _didInit = true;
  }

  Future<bool> setString(String key, String value) {
    return _preferences.setString(key, value);
  }

  Future<bool> setInt(String key, int value) {
    return _preferences.setInt(key, value);
  }

  Future<bool> setMap(String key, Map<String, dynamic> value) {
    return _preferences.setString(key, jsonEncode(value));
  }

  Set<String> getKeys(String key) {
    return _preferences.getKeys();
  }

  String? getString(String key) {
    return _preferences.getString(key);
  }

  int? getInt(String key) {
    return _preferences.getInt(key);
  }

  Map<String, dynamic>? getMap(String key) {
    final json = _preferences.getString(key);
    if (json == null) return null;
    return jsonDecode(json);
  }
}
