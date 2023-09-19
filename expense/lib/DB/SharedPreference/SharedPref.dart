import 'dart:convert';

import 'package:expense/Models/SF_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:expense/Models/user_model.dart';


class SharedPref {
  static const String _keyUser = 'MemondiaUserSP';

  static Future<void> saveUser(UserModel user) async {
    SFUserModel sfUserModel = SFUserModel(
      createdAt: user.createdAt.toString(),
      email:user.email,
      id: user.id,
      logout: user.logout,
      name: user.name,
      updatedAt: user.updatedAt.toString(),
    );
    final prefs = await SharedPreferences.getInstance();
    final userJson = sfUserModel.toJson();
    await prefs.setString(_keyUser, userJson);
  }

  static Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_keyUser);
    if (userJson != null) {
      final userMap = jsonDecode(userJson);
      SFUserModel? model = SFUserModel.fromJson(userJson);
      UserModel? userModel  = UserModel(
        createdAt: SFUserModel().getCreatedAtAsDateTime(model.createdAt),
        updatedAt: SFUserModel().getUpdatedAtAsDateTime(model.updatedAt),
        email: model.email,
        id: model.id,
        logout: model.logout,
        name: model.name
        
      ); 

      return userModel;
    }
    return null;
  }

  static Future<void> removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUser);
  }
}
