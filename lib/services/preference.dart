import 'package:shared_preferences/shared_preferences.dart';

/// shared preference service
class SharedPrefs implements PrefsService {
  SharedPreferences _prefs;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> flush() async {
    await _prefs.clear();
  }

  @override
  set token(String token) => _prefs.setString('token', token);
  @override
  String get token => _prefs.getString('token') ?? '';
}

abstract class PrefsService {
  Future<void> init();

  /// clear the prefs in the case of a signout or any other effect
  Future<void> flush();
  String get token;

  /// save an auth token to this device
  set token(String value);
}
