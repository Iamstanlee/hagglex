import 'package:flutter/material.dart';
import 'package:hagglex/models/country.dart';
import 'package:hagglex/models/request/signupReq.dart';
import 'package:hagglex/models/user.dart';
import 'package:hagglex/services/authentication.dart';
import 'package:hagglex/services/sharedPreference.dart';
import 'package:hagglex/ui/signup/verifyPhone.dart';
import 'package:hagglex/ui/welcome/welcome.dart';
import 'package:hagglex/utils/api.dart';
import 'package:hagglex/utils/helpers.dart';
import 'package:hagglex/widgets/toast.dart';

class SignupViewModel with ChangeNotifier {
  final AuthServiceImpl authService;
  SignupViewModel(this.authService);
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

  void signupUser(BuildContext context) async {
    signupRequest.country = selectedCountry.name;
    signupRequest.currency = selectedCountry.currencyCode;
    response = Response.loading("Signing you up...");
    authService.signup(signupRequest).then((res) {
      response = Response.completed(res.user);
      _email = res.user.email;
      getIt<SharedPrefService>().token = res.token;
      // verify the user email/phone
      push(context, route: VerifyPhonePage());
    }).catchError((err) {
      response = Response.error(err.toString());
      errorToast(context, err.toString());
    });
  }

  void verifyUser(BuildContext context) async {
    response = Response.loading("Please wait...");
    authService.verify(code).then((res) {
      response = Response.completed(res.user);
      if (res.user.emailVerified) {
        // if signup is successful, store the user token
        getIt<SharedPrefService>().token = res.token;
        push(context, route: WelcomePage(), popOFF: true);
      }
    }).catchError((err) {
      response = Response.error(err.toString());
      errorToast(context, err.toString());
    });
  }

  void resendVerificationCode(BuildContext context, [String email]) async {
    response = Response.loading("Resending code...");
    authService.resendCode(_email ?? email).then((res) {
      if (res) {
        response = Response.initial();
        Toast.show(context, "Verification code sent!");
      }
    }).catchError((err) {
      response = Response.error(err.toString());
      errorToast(context, err.toString());
    });
  }

  void getActiveCountries(BuildContext context) {
    countriesResponse = Response.loading("Please wait...");
    authService.fetchActiveCountries().then((countries) {
      selectedCountry =
          countries.firstWhere((country) => country.name == "Nigeria");
      countriesResponse = Response.completed(countries);
    }).catchError((err) {
      countriesResponse = Response.error(err.toString());
      errorToast(context, err.toString());
    });
  }
}
