import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;

  static const _keyUsername = 'username';
  static const _keyBirthday = 'birthday';

  Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String username, String LastName) async =>
      await _preferences.setString(_keyUsername, username + '' + LastName);

  static getUsername() => _preferences.getString(_keyUsername);

  static Future setAge(
    String age,
  ) async =>
      await _preferences.setString('age', age);

  static getAge() => _preferences.getString('age');

  static Future setPhone(
    String age,
  ) async =>
      await _preferences.setString('phone', age);

  static getPhone() => _preferences.getString('phone');

  static Future setEmail(
    String age,
  ) async =>
      await _preferences.setString('email', age);

  static getEmail() => _preferences.getString('email');

  static Future setBirthday(DateTime dateOfBirth) async {
    final birthday = dateOfBirth.toIso8601String();

    return await _preferences.setString(_keyBirthday, birthday);
  }

  static DateTime? getBirthday() {
    final birthday = _preferences.getString(_keyBirthday);

    return birthday == null ? null : DateTime.tryParse(birthday);
  }
}
