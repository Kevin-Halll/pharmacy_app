import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  // `saveString` is used for both creation and updating.
  static Future<bool> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  static Future<String?> readString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final String? value = prefs.getString(key);

    return value;
  }

  //TODO continue integrating authService for Sing in and Register page

  static Future<bool> deleteString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
