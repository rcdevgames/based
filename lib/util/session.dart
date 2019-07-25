import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Sessions {
  SharedPreferences prefs;

  Future<bool> checkAuth() async {
    prefs = await SharedPreferences.getInstance();
    var auth_type = await prefs.getString("login_as");
    var res;
    if (auth_type == 'user') {
      res = await prefs.getString("auth_customer");
    }else{
      res = await prefs.getString("auth_worker");
    }
    print("Auth Type : $auth_type | Auth : $res");
    if (res == null) return false;
    return true;
  }

  save(String key, String data) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
    prefs.commit();
  }

  clear() async {
    prefs = await SharedPreferences.getInstance();
    // prefs.remove("login_as");
    prefs.remove("auth_customer");
    prefs.remove("auth_worker");
  }

  Future<String> load(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  remove(String key) async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  // Future<User> loadUser() async {
  //   prefs = await SharedPreferences.getInstance();
  //   return compute(userFromJson, prefs.getString("auth"));
  // }
}

final sessions = Sessions();