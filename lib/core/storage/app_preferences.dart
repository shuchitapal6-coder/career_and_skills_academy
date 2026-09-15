import 'dart:convert';

import 'package:career_and_skills_academy/core/storage/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modals/user_modal.dart';

class SharedPrefManager {
  SharedPrefManager._();

  static final SharedPrefManager instance = SharedPrefManager._();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const String tokenKey = "token";

  // static const String userKey = "app_users";

  static const String userKey = "customer";
  static const String loginKey = "is_logged_in";
  static const String languageKey = "language";
  static const String languageSelectedKey = "language_selected";
  static const String allStatesKey = "all_states";
  static const String allCitiesKey = "all_cities";

  Future<void> saveReporter(ReporterModel reporter) async {
    await setObject(
      StorageKeys.reporter,
      reporter.toJson(),
    );
  }
  ReporterModel? getReporter() {
    final data = getObject(StorageKeys.reporter);

    if (data == null) return null;

    return ReporterModel.fromJson(data);
  }

  bool get isLoggedIn => getBool(StorageKeys.isLoggedIn);

  int get userId => getInt(StorageKeys.userId);

  String get phone => getString(StorageKeys.phone);

  bool get isLanguageSelected => getBool(StorageKeys.languageSelected);

  String get selectedLanguage => getString(StorageKeys.selectedLanguage);

  Future<void> saveToken(String token) async {
    await _prefs.setString(tokenKey, token);
    print("TOKEN IN PREFS => ${_prefs.getString(tokenKey)}");
  }

  static Map<String, dynamic>? get user =>
      SharedPrefManager.instance.getObject("customer");

  String get userToken {
    return _prefs.getString(tokenKey) ?? "";
  }

  Future<void> clearToken() async {
    await _prefs.remove(tokenKey);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<void> saveLanguage(String languageCode) async {
    await _prefs.setString(StorageKeys.selectedLanguage, languageCode);

    await _prefs.setBool(StorageKeys.languageSelected, true);

    await _prefs.reload();
    print(_prefs.getString(StorageKeys.selectedLanguage));
    print(_prefs.getBool(StorageKeys.languageSelected));
  }

  String get language => _prefs.getString(languageKey) ?? "en";

  String getString(String key, {String defaultValue = ''}) {
    return _prefs.getString(key) ?? defaultValue;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  int getInt(String key, {int defaultValue = 0}) {
    return _prefs.getInt(key) ?? defaultValue;
  }

  Future<bool> setDouble(String key, double value) async {
    return await _prefs.setDouble(key, value);
  }

  double getDouble(String key, {double defaultValue = 0.0}) {
    return _prefs.getDouble(key) ?? defaultValue;
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  List<String> getStringList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  Future<bool> setObject(String key, Map<String, dynamic> value) async {
    return await _prefs.setString(key, jsonEncode(value));
  }

  Map<String, dynamic>? getObject(String key) {
    final jsonString = _prefs.getString(key);

    if (jsonString == null || jsonString.isEmpty) {
      return null;
    }

    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  bool containsKey(String key) {
    return _prefs.containsKey(key);
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  Future<bool> clear() async {
    return await _prefs.clear();
  }

}
