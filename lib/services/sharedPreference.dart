import 'package:shared_preferences/shared_preferences.dart';

/// shared preference service
class SharedPrefService {
  SharedPreferences _sharedPreferences;

  Future<SharedPrefService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  void setToken(String key, String item) {
    _sharedPreferences.setString(key, item);
  }

  String getToken(String key) {
    return _sharedPreferences.getString(key) ?? "";
  }
}
