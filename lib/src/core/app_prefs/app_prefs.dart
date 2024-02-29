import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:king_saud_hospital/src/core/resources/language_manager.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/user_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String token = 'token';
const String skipLogin = 'skip';
const String language = 'language';
const String userKey = 'user';
const String imagePath = 'image';
const String email = 'email';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  /// user
  Future<void> setUserToken(String userToken) async {
    await _sharedPreferences.setString(token, userToken);
  }

  String getUserToken() {
    return _sharedPreferences.getString(token) ?? '';
  }

  bool isUserLoggedIn() {
    return _sharedPreferences.containsKey(token);
  }

  bool isSkipLogin() {
    final isSkip = getUserToken();

    if (isSkip == skipLogin) {
      return true;
    }

    return false;
  }

  Future<bool> removeUserToken() async {
    await _sharedPreferences.remove(userKey);
    return await _sharedPreferences.remove(token);
  }

  /// ][][][][][]
  ///
  Future<void> setUser(UserModel user) async {
    await _sharedPreferences.setString(userKey, jsonEncode(user.toJson()));
  }

  UserModel getUser() {
    String? userPref = _sharedPreferences.getString(userKey);

    if (userPref == null) {
      return UserModel.fromJson(noneUser);
    }

    Map<String, dynamic> userMap = jsonDecode(userPref) as Map<String, dynamic>;
    return UserModel.fromJson(userMap);
  }

  ///
  ///
  ///
  ///
  Future<void> saveImagePath(String path) async {
    await _sharedPreferences.setString(imagePath, path);
  }

  String getImagePath() {
    return _sharedPreferences.getString(imagePath) ?? '';
  }

  Future<void> saveUserEmail(String e) async {
    await _sharedPreferences.setString(email, e);
  }

  String getUserEmail() {
    return _sharedPreferences.getString(email) ?? '';
  }

  /// language

  String getAppLang() {
    String? lang = _sharedPreferences.getString(language);

    if (lang != null && lang.isNotEmpty) {
      return lang;
    } else {
      return LanguageType.english.getValue();
    }
  }

  Future<void> changeAppLang() async {
    String currentLang = getAppLang();

    if (currentLang == LanguageType.arabic.getValue()) {
      await _sharedPreferences.setString(
          language, LanguageType.english.getValue());
    } else {
      await _sharedPreferences.setString(
          language, LanguageType.arabic.getValue());
    }
  }

  Future<Locale> getLocal() async {
    String currentLang = getAppLang();
    if (currentLang == LanguageType.arabic.getValue()) {
      return arabicLocal;
    } else {
      return englishLocal;
    }
  }
}

Map<String, dynamic> noneUser = {
  "message": '',
  "token": '',
  "email": '',
  "user_id": 0,
  "status": '',
};
