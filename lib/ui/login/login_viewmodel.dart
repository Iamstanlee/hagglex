import 'package:flutter/material.dart';
import 'package:hagglex/models/request/login_req.dart';
import 'package:hagglex/models/user.dart';
import 'package:hagglex/services/authentication.dart';
import 'package:hagglex/services/preference.dart';
import 'package:hagglex/ui/dashboard/dashboard.dart';
import 'package:hagglex/ui/login/login.dart';
import 'package:hagglex/ui/signup/verify_phone.dart';
import 'package:hagglex/utils/api.dart';
import 'package:hagglex/utils/helpers.dart';

class LoginViewModel with ChangeNotifier {
  final AuthService _auth;
  final PrefsService _prefs;
  LoginViewModel({AuthService auth, PrefsService prefs})
      : _auth = auth ?? getIt<AuthService>(),
        _prefs = prefs ?? getIt<PrefsService>();

  String _email;
  Response<User> _response = Response.initial();
  Response get response => _response;
  set response(Response<User> response) {
    this._response = response;
    notifyListeners();
  }

  LoginRequest loginRequest = LoginRequest();

  void loginUser() async {
    response = Response.loading("Please wait...");
    _auth.login(loginRequest).then((res) {
      response = Response.completed(res.user);
      _email = res.user.email;
      _prefs.token = res.token;
      if (res.user.emailVerified) {
        // if login is successful and user email is verified, store the user token
        // we can do some other stuff here like checking if the user email has 2FA enabled
        push(ctx, route: DashboardPage(), popOFF: true);
      } else {
        resendVerificationCode();
      }
    }).catchError((err) {
      response = Response.error(err.toString());
      print(err.toString());
    });
  }

  void resendVerificationCode() async {
    _auth.resendCode(_email).then((res) {
      response = Response.initial();
      if (res) {
        push(ctx, route: VerifyPhonePage(email: _email));
      }
    }).catchError((err) {
      response = Response.error(err.toString());
      print(err.toString());
    });
  }

  void logoutUser() async {
    await _auth.logout();
    push(ctx, route: LoginPage(), popOFF: true);
  }
}
