import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// {@template cache_client}
/// An in-memory cache client.
/// {@endtemplate}
class CacheClient {
  /// {@macro cache_client}
  CacheClient();

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  void writeBool({required String key, required bool value}) {
    _prefs.then((prefs) => prefs.setBool(key, value));
  }

  Future<bool?> readBool({required String key}) async {
    return await _prefs.then((prefs) => prefs.getBool(key));
  }

  void writeInt({required String key, required int value}) {
    _prefs.then((prefs) => prefs.setInt(key, value));
  }

  Future<int?> readInt({required String key}) async {
    return await _prefs.then((prefs) => prefs.getInt(key));
  }

  void writeString({required String key, required String value}) {
    _prefs.then((prefs) => prefs.setString(key, value));
  }

  void writeObject({required String key, required Map<String, dynamic> value}) {
    var valueString = jsonEncode(value);
    writeString(key: key, value: valueString);
  }

  Future<dynamic> readString({required String key}) async {
    return (await _prefs).getString(key) ?? null;
  }

  Future<Map<String, dynamic>> readObject({required String key}) async {
    try {
      var valueString = await readString(key: key);
      if (valueString == null) throw Exception('Value is null');
      return jsonDecode(valueString);
    } on FormatException {
      remove(key: key);
      throw Exception('Value is not a valid JSON object');
    } catch (e) {
      print('Error: $e');
      return Map<String, dynamic>();
    }
  }

  void remove({required String key}) {
    print('remove: $key');
    _prefs.then((prefs) => prefs.remove(key));
  }
}
