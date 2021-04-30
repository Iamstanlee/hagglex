import 'package:flutter/material.dart';
import 'package:hagglex/models/request/loginReq.dart';
import 'package:hagglex/models/user.dart';
import 'package:hagglex/services/authentication.dart';
import 'package:hagglex/services/sharedPreference.dart';
import 'package:hagglex/ui/dashboard/dashboard.dart';
import 'package:hagglex/utils/api.dart';
import 'package:hagglex/utils/helpers.dart';
import 'package:hagglex/widgets/toast.dart';

class SignupViewModel with ChangeNotifier {
  final AuthServiceImpl authService;
  SignupViewModel(this.authService);

  Response<User> _response = Response.initial();
  Response get response => _response;
  set response(Response<User> response) {
    this._response = response;
    notifyListeners();
  }

  LoginRequest loginRequest = new LoginRequest();

  void signupUser(BuildContext context) async {
    response = Response.loading("Please wait...");
    if (!loginRequest.isRequired) {}
    // .catchError((err) {
    //     response = Response.error(err.toString());
    //     errorToast(context, err.toString());
    //   });
  }
}
