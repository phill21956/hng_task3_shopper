import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hng_task3_shopper/models/history_model.dart';
import 'package:hng_task3_shopper/models/product_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static late SharedPreferences sharedPreferences;

  /// initialize sharedpreferences
  PrefUtils() {
    // initialize();
    SharedPreferences.getInstance().then((value) {
      sharedPreferences = value;
      if (kDebugMode) {
        print("-----INITIALIZED SHARED PREF 1-----");
      }
    });
  }

  static Future<void> initialize() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // clearPreferencesData();
    if (kDebugMode) {
      print("-----INITIALIZED SHARED PREF 2-----");
    }
    // await OfflineDb.init();
  }

  ///will clear all the data stored in preference
  static clearPreferencesData() async {
    await sharedPreferences.clear();
  }

  /// will remove a [key] data stored in preference
  static remove(String key) async {
    sharedPreferences.remove(key);
  }

  /// get stored string by [key]
  static String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  /// store string by [key] and [value]
  static Future<bool> setString(String key, String value) async {
    return await sharedPreferences.setString(key, value);
  }

  /// get stored bool by [key]
  static bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  /// store bool by [key] and [value]
  static Future<bool> setBool(String key, bool value) async {
    return await sharedPreferences.setBool(key, value);
  }

  /// constains key [key]
  static bool find(String key) {
    return sharedPreferences.containsKey(key);
  }

  static Future<void> saveCartOrder(
      String key, List<OrderHistoryModel> data) async {
    final jsonData = jsonEncode(data.map((order) => order.toJson()).toList());
    await sharedPreferences.setString(key, jsonData);
  }

  static Future<List<OrderHistoryModel>> getCartOrder(String key) async {
    final jsonString = sharedPreferences.getString(key);
    if (jsonString != null) {
      final List<dynamic> jsonResponse = jsonDecode(jsonString);
      return jsonResponse
          .map((order) => OrderHistoryModel.fromJson(order))
          .toList();
    }
    return [];
  }
}
