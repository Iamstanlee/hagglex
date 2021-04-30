import 'package:flutter/material.dart';
import 'package:hagglex/models/country.dart';
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

  Response _response = Response.initial();
  Response get response => _response;
  set response(Response response) {
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
    response = Response.loading("Please wait...");
    // .catchError((err) {
    //     response = Response.error(err.toString());
    //     errorToast(context, err.toString());
    //   });
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
