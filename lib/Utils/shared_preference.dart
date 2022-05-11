import 'package:shared_preferences/shared_preferences.dart';

class PrefManager{

  static const String token = 'token';
  static const String username = 'username';
  static const String emailAddress = 'emailAddress';
  static const String password = 'password';

  static Future<bool> setToken(String value)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(token, value);
  }
  static Future<String> getToken()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(token) ?? "";
  }
  static Future<bool> setUsername(String value)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(username, value);
  }
  static Future<String> getUsername()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(username) ?? "";
  }
  static Future<bool> setEmailAddress(String value)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(emailAddress, value);
  }
  static Future<String> getEmailAddress()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(emailAddress)??"";
  }
  static Future<bool> setPassword(String value)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(password, value);
  }
  static Future<String> getPassword()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(password)??"";
  }
}