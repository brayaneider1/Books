import 'dart:convert';

import 'package:books/domain/models/UserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSearchlePreferences {


  static late SharedPreferences _preferences;

  Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setSearchValue(String search) async =>
      await _preferences.setString('search', search );

  static getSearchValue() => _preferences.getString('search');

}
