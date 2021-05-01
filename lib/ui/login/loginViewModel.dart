import 'package:flutter/material.dart';
import 'package:hagglex/models/request/loginReq.dart';
import 'package:hagglex/models/user.dart';
import 'package:hagglex/services/authentication.dart';
import 'package:hagglex/services/sharedPreference.dart';
import 'package:hagglex/ui/dashboard/dashboard.dart';
import 'package:hagglex/ui/login/login.dart';
import 'package:hagglex/ui/signup/verifyPhone.dart';
import 'package:hagglex/utils/api.dart';
import 'package:hagglex/utils/helpers.dart';
import 'package:hagglex/widgets/toast.dart';

class LoginViewModel with ChangeNotifier {
  final AuthServiceImpl authService;
  LoginViewModel(this.authService);
  String _email;
  Response<User> _response = Response.initial();
  Response get response => _response;
  set response(Response<User> response) {
    this._response = response;
    notifyListeners();
  }

  LoginRequest loginRequest = LoginRequest();

  void loginUser(BuildContext context) async {
    response = Response.loading("Please wait...");
    authService.login(loginRequest).then((res) {
      response = Response.completed(res.user);
      _email = res.user.email;
      getIt<SharedPrefService>().token = res.token;
      if (res.user.emailVerified) {
        // if login is successful, store the user token
        // we can do some other stuff here like checking if the user email is verified
        // or has 2FA enabled
        push(context, route: DashboardPage(), popOFF: true);
      } else {
        resendVerificationCode(context);
      }
    }).catchError((err) {
      response = Response.error(err.toString());
      errorToast(context, err.toString());
    });
  }

  void resendVerificationCode(BuildContext context) async {
    authService.resendCode(_email).then((res) {
      response = Response.initial();
      if (res) {
        push(context, route: VerifyPhonePage(email: _email));
      }
    }).catchError((err) {
      response = Response.error(err.toString());
      errorToast(context, err.toString());
    });
  }

  void logoutUser(BuildContext context) async {
    await authService.logout();
    push(context, route: LoginPage(), popOFF: true);
  }
}
