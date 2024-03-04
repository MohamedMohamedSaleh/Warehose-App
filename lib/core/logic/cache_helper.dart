import 'package:shared_preferences/shared_preferences.dart';
import 'package:warehouse/views/auth/login/login_model.dart';

class CacheHelper {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveUserData({required UserData model}) async {
    _prefs.setString('token', model.token);
    _prefs.setString('id', model.id);
    _prefs.setString('username', model.username);
    _prefs.setString('name', model.name);
    _prefs.setString('department', model.department);
    _prefs.setString('token_expire', model.tokenExpire);
    _prefs.setString('role', model.role);
  }

  static bool isAuth() {
    String? token = _prefs.getString('token');
    return token != null || (token ?? "").isNotEmpty;
  }

  static String? getUserToken() {
    return _prefs.getString('token');
  }
  static String? getUsername() {
    return _prefs.getString('name');
  }

  static String? getUserId() {
    return _prefs.getString('id');
  }

  static Future<bool> clearUserData() {
    return _prefs.clear();
  }
}
