import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sharedpref {
  static SharedPreferences? prefs;

  static const key = 'key';

  static Future init() async {
    prefs = await SharedPreferences.getInstance(); 
  }

  static Future setdata(String data) async {
    await prefs?.setString(key, data);
  }

  static String? getdata() {
    prefs?.getString(key);
  }
}