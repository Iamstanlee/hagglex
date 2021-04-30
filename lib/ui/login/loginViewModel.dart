import 'package:flutter/material.dart';
import 'package:hagglex/models/request/loginReq.dart';
import 'package:hagglex/models/user.dart';
import 'package:hagglex/services/authentication.dart';
import 'package:hagglex/services/sharedPreference.dart';
import 'package:hagglex/ui/dashboard/dashboard.dart';
import 'package:hagglex/utils/api.dart';
import 'package:hagglex/utils/helpers.dart';

class LoginViewModel with ChangeNotifier {
  final AuthServiceImpl authService;
  LoginViewModel(this.authService);

  Response<User> _response = Response.initial("Please wait...");
  Response get response => _response;
  set response(Response<User> response) {
    this._response = response;
    notifyListeners();
  }

  LoginRequest loginRequest = new LoginRequest();

  void loginUser(BuildContext context) async {
    if (!loginRequest.isRequired) {
      authService.login(loginRequest).then((res) {
        // if login is successful, store the user token
        getIt<SharedPrefService>().setToken("token", res.token);
        response = Response.completed(res.user);
        push(context, route: DashboardPage());
      }).catchError((err) {
        response = Response.error(err);
      });
    }
  }
}
