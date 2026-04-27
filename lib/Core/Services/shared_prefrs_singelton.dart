import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrsSingelton {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setbool({
    required String key,
    required bool value,
  }) async {
    return await prefs.setBool(key, value);
  }

  static bool getbool({required String key}) {
    return prefs.getBool(key) ?? false;
  }

  static Future<bool> setString(String key, String value) async {
    return await prefs.setString(key, value);
  }
static String? getString(String key)  {
   return prefs.getString(key);
  }
}
