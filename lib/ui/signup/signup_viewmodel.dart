import 'package:flutter/material.dart';
import 'package:hagglex/models/country.dart';
import 'package:hagglex/models/request/signup_req.dart';
import 'package:hagglex/models/user.dart';
import 'package:hagglex/services/authentication.dart';
import 'package:hagglex/services/preference.dart';
import 'package:hagglex/ui/signup/verify_phone.dart';
import 'package:hagglex/ui/welcome/welcome.dart';
import 'package:hagglex/utils/api.dart';
import 'package:hagglex/utils/helpers.dart';

class SignupViewModel with ChangeNotifier {
  final AuthService _auth;
  final PrefsService _prefs;
  SignupViewModel({AuthService auth, PrefsService prefs})
      : _auth = auth ?? getIt<AuthService>(),
        _prefs = prefs ?? getIt<PrefsService>();

  SignupRequest signupRequest = SignupRequest();

  int code;
  String _email;
  Response<User> _response = Response.initial();
  Response<User> get response => _response;
  set response(Response<User> response) {
    this._response = response;
    notifyListeners();
  }

  Response<List<Country>> _countriesResponse = Response.initial();
  Response<List<Country>> get countriesResponse => _countriesResponse;
  set countriesResponse(Response<List<Country>> response) {
    this._countriesResponse = response;
    notifyListeners();
  }

  Country _selectedCountry;
  Country get selectedCountry => _selectedCountry;
  set selectedCountry(Country country) {
    this._selectedCountry = country;
    notifyListeners();
  }

  void signupUser() async {
    signupRequest.country = selectedCountry.name;
    signupRequest.currency = selectedCountry.currencyCode;
    response = Response.loading("Signing you up...");
    _auth.signup(signupRequest).then((res) {
      response = Response.completed(res.user);
      _email = res.user.email;
      _prefs.token = res.token;
      // verify the user email/phone
      push(ctx, route: VerifyPhonePage());
    }).catchError((err) {
      response = Response.error(err.toString());
      print(err.toString());
    });
  }

  void verifyUser() async {
    response = Response.loading("Please wait...");
    _auth.verify(code).then((res) {
      response = Response.completed(res.user);
      if (res.user.emailVerified) {
        // if signup is successful, store the user token
        _prefs.token = res.token;
        push(ctx, route: WelcomePage(), popOFF: true);
      }
    }).catchError((err) {
      response = Response.error(err.toString());
      print(err.toString());
    });
  }

  void resendVerificationCode([String email]) async {
    response = Response.loading("Resending code...");
    _auth.resendCode(_email ?? email).then((res) {
      if (res) {
        response = Response.initial();
        print("verification code sent!");
      }
    }).catchError((err) {
      response = Response.error(err.toString());
      print(err.toString());
    });
  }

  void getActiveCountries() {
    countriesResponse = Response.loading("Please wait...");
    _auth.fetchActiveCountries().then((countries) {
      selectedCountry =
          countries.firstWhere((country) => country.name == "Nigeria");
      countriesResponse = Response.completed(countries);
    }).catchError((err) {
      countriesResponse = Response.error(err.toString());
      print(err.toString());
    });
  }
}
