import 'package:hagglex/utils/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// shared preference service
class SharedPrefService {
  SharedPreferences _sharedPreferences;

  Future<Null> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  set token(String token) => _sharedPreferences.setString('token', token);
  String get token => _sharedPreferences.getString('token') ?? '';
}
