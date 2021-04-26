import 'package:flutter/material.dart';

///
/// Resources class
///
class R {
// ignore: non_constant_identifier_names
  static final Icons = _Icon();
// ignore: non_constant_identifier_names
  static final Strings = _String();
// ignore: non_constant_identifier_names
  static final Colors = _Colors();
}

class _Icon {
  static String iconPath(String icon) => 'assets/icons/$icon.svg';
  String get icCatFilled => iconPath('cat_fill');
}

class _String {
  String get primaryFont => "BasisGrotesquePro";
  String get emptyStr => ' can be null but it should not be empty';
  String get fieldReq => 'This field is required';
  String get invalidPhoneNumber => 'Invalid phone number';
  String get passwordShortLength =>
      'Password must be greater than 5 characters';
  String get invalidEmail => 'Invalid email address';
  String get unKnownError => 'Unknown Error';
  String get sthWentWrong => 'Something went wrong.';
  String get unKnownResponse => 'Unknown server response';
}

class _Colors {
  Color get primaryColor => Color(0xFF2E1963);
  Color get primaryColorLight => Color(0xFF7362A1);
  Color get scaffoldColor => Color(0xFFFFFFFF);
  Color get errorColor => Color(0xFFFF0033);
  Color get blackColor => Color(0xFF000000);
  Color get orangeColor => Color(0xFFFFC175);
  Color get elevatedBtnTextColor => Color(0xFF3E0606);
  Color get focusedTextFieldColor => Color(0xFFBA3AF9);
}
