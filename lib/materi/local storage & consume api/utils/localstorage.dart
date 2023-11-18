import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageUtils {
  static late SharedPreferences _preferences;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Save a string value to SharedPreferences
  static void saveString(String key, String value) {
    _preferences.setString(key, value);
  }

  // Get a string value from SharedPreferences
  static String getString(String key, {String defaultValue = ''}) {
    return _preferences.getString(key) ?? defaultValue;
  }

  // Save an integer value to SharedPreferences
  static void saveInt(String key, int value) {
    _preferences.setInt(key, value);
  }

  // Get an integer value from SharedPreferences
  static int getInt(String key, {int defaultValue = 0}) {
    return _preferences.getInt(key) ?? defaultValue;
  }

  // Save a boolean value to SharedPreferences
  static void saveBool(String key, bool value) {
    _preferences.setBool(key, value);
  }

  // Get a boolean value from SharedPreferences
  static bool getBool(String key, {bool defaultValue = false}) {
    return _preferences.getBool(key) ?? defaultValue;
  }

  // Remove a value from SharedPreferences
  static void remove(String key) {
    _preferences.remove(key);
  }

  static void setAuthenticated(bool value) {
    _preferences.setBool('isAuthenticated', value);
  }

  static void logout() {
    _preferences.remove('isAuthenticated');
  }

  static bool isAuthenticated() {
    return _preferences.getBool('isAuthenticated') ?? false;
  }
}
