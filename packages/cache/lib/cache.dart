import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheClient {
  CacheClient({SharedPreferencesAsync? prefs})
      : prefs = prefs ?? SharedPreferencesAsync();

  final SharedPreferencesAsync prefs;

  Future<void> writeBool({required String key, required bool value}) {
    return prefs.setBool(key, value);
  }

  Future<bool?> readBool({required String key}) {
    return prefs.getBool(key);
  }

  Future<void> writeInt({required String key, required int value}) {
    return prefs.setInt(key, value);
  }

  Future<int?> readInt({required String key}) {
    return prefs.getInt(key);
  }

  Future<void> writeString({required String key, required String value}) {
    return prefs.setString(key, value);
  }

  Future<void> writeObject(
      {required String key, required Map<String, dynamic> value}) {
    var valueString = jsonEncode(value);
    return writeString(key: key, value: valueString);
  }

  Future<String?>? readString({required String key}) {
    return prefs.getString(key);
  }

  Future<Map<String, dynamic>> readObject({required String key}) async {
    try {
      var valueString = await readString(key: key);
      print(valueString);
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

  Future<void> remove({required String key}) {
    return prefs.remove(key);
  }
}
