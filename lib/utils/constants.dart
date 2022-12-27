import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static setUserData(bool val, String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', val);
    await prefs.setString('name', username);
  }
}