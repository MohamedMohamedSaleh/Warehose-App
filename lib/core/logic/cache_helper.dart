import 'package:shared_preferences/shared_preferences.dart';
import 'package:warehouse/features/notiffications/model.dart';
import 'package:warehouse/views/auth/login/login_model.dart';
import 'dart:convert';

class CacheHelper {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveUserData({required UserData model}) async {
    await _prefs.setString('token', model.token);
    await _prefs.setString('id', model.id);
    await _prefs.setString('username', model.username);
    await _prefs.setString('name', model.name);
    await _prefs.setString('department', model.department);
    await _prefs.setString('token_expire', model.tokenExpire);
    await _prefs.setString('role', model.role);
    await _prefs.setString('image', model.image);
  }

  static Future<void> deletUserData() async {
    await _prefs.remove('token');
    await _prefs.remove('id');
    await _prefs.remove('username');
    await _prefs.remove('name');
    await _prefs.remove('department');
    await _prefs.remove('token_expire');
    await _prefs.remove('role');
    await _prefs.remove('supply');
    await _prefs.remove('image');
  }

  static bool isAuth() {
    String? token = _prefs.getString('token');
    String? supply = _prefs.getString('supply');
    return (token != null || (token ?? "").isNotEmpty) &&
        (supply != null || (supply ?? '').isNotEmpty);
  }

  static Future<void> setNotification(List<NotificationData> list) async {
    List<String> encodeList =
        list.map((notificate) => jsonEncode(notificate.toJson())).toList();
    await _prefs.setStringList('noti', encodeList);
  }

  static List<NotificationData>? getNotifications() {
    List<String>? noti = _prefs.getStringList('noti');
    final List<NotificationData> notification;
    if (noti != null) {
      notification = noti
          .map(
              (notificate) => NotificationData.fromJson(jsonDecode(notificate)))
          .toList();
      return notification;
    } else {
      return null;
    }
  }

  static Future<void> setSupply({required String supply}) async {
    _prefs.setString('supply', supply);
  }

  static Future<void> setTokenFirebase({required String tokenFirebase}) async {
    _prefs.setString('tokenFirebase', tokenFirebase);
  }

  static Future<void> setNumNoti({int num = 0}) async {
    _prefs.setInt('num_nuti', num);
  }

  static int? getNumNoti() {
    return _prefs.getInt('num_nuti');
  }

  static String? getSupply() {
    return _prefs.getString('supply');
  }
  static String? getDepartment() {
    return _prefs.getString('department');
  }

  static String? getUserImage() {
    return _prefs.getString('image');
  }

  static String? getUserRole() {
    return _prefs.getString('role');
  }

  static String? getUserExpiration() {
    return _prefs.getString('token_expire');
  }

  static String? getUserToken() {
    return _prefs.getString('token');
  }
  static String? getUserTokenFirebase() {
    return _prefs.getString('tokenFirebase');
  }



  static String? getUsername() {
    return _prefs.getString('name');
  }

  static String? getUserId() {
    return _prefs.getString('id');
  }

  static bool? getIsDark() {
    return _prefs.getBool('isDark');
  }

  static Future<void> setIsDark({required bool isDark}) async {
    _prefs.setBool("isDark", isDark);
  }

  static Future<bool> clearUserData() {
    return _prefs.clear();
  }
}
