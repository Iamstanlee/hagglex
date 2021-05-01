import 'package:shared_preferences/shared_preferences.dart';

/// shared preference service
class SharedPrefService {
  SharedPreferences _sharedPreferences;

  Future<Null> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  set token(String token) => _sharedPreferences.setString('token', token);
  String get token => _sharedPreferences.getString('token') ?? '';

// clear the sharedprefs in the case of a signout or any other effect
  Future<Null> flush() async {
    await _sharedPreferences.clear();
  }
}
