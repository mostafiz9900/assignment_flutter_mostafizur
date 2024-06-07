import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService{
  static final _box = GetStorage();

  static void save(String key, dynamic value) {
    _box.write(key, value);
  }

  // Function to retrieve a value by its key
  static dynamic read(String key) {
    return _box.read(key);
  }

  // Function to remove a value by its key
  static void remove(String key) {
    _box.remove(key);
  }

// Save Map
  static Future<void> saveMap(String key, Map<String, dynamic> map) async {
    await _box.write(key, map);
  }

// Get Map
  static Map<String, dynamic>? getMap(String key) {
    return _box.read(key);
  }
  static Future<void> setWithExpiration(String key, String value, Duration expiration) async {
    final data = {
      'value': value,
      'expiration': DateTime.now().add(expiration).toIso8601String(),
    };
    await _box.write(key, json.encode(data));
  }

  static String getWithExpiration(String key) {
    final jsonString = _box.read(key) as String?;
    if (jsonString != null) {
      final data = json.decode(jsonString);
      final expiration = DateTime.parse(data['expiration']);
      if (expiration.isAfter(DateTime.now())) {
        return data['value'];
      } else {
        _box.remove(key);
      }
    }
    return '';
  }

  init() {}
  // static Future<void> saveUserData(String userData) async {
  //   await LocalStorageService.setString(_userKey, userData);
  // }
  //
  // static String getUserData() {
  //   return LocalStorageService.getString(_userKey);
  // }

/*class StorageService extends GetxService {
  static StorageService get to => Get.find();
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
      _prefs = await SharedPreferences.getInstance();
      return this;
  }

  Future<bool> setString(String key, String value) async {
      return await _prefs.setString(key, value);
  }

  // Other methods for retrieving data
  // ...
  // ...
}*/
}