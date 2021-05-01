import 'package:flutter/material.dart';
import 'package:hagglex/utils/api.dart';
import 'package:hagglex/utils/res.dart';

/// default validator, used when no validator is provided to the textinput
String validateField(String fieldValue) {
  return fieldValue.isNotEmpty ? null : R.Strings.fieldReq;
}

/// validate a form with it `key`, `next()` is called if the form is valid
void validateForm(GlobalKey<FormState> formKey, {VoidCallback next}) {
  FormState formState = formKey.currentState;
  if (formState.validate()) {
    formState.save();
    next();
  }
}

String validateEmail(String value) {
  if (nullify(value) == null) return 'Field is required';
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
  if (!emailValid) {
    return 'Invalid email address';
  }
  return null;
}

String validateText(String value) {
  if (nullify(value) == null) return 'Field is required';
  bool textValid = RegExp(r"^[a-zA-Z0-9]+$").hasMatch(value);
  if (!textValid) {
    return 'Invalid, Please check your input';
  }
  return null;
}

String validatePassword(String value) {
  if (nullify(value) == null)
    return 'Password should be greater than 8 characters';

  if (isPasswordStrong(value) == PASSWORDSTRENGTH.WEAK) {
    return "Weak password, Password should contain atleast a number, and an uppercase character";
  }
  return null;
}

/// ineffficiently determine password strength, lol.
PASSWORDSTRENGTH isPasswordStrong(String password) {
  if (nullify(password) == null)
    throw InvalidInputException(
        "Invalid input:- Expected String but found ${password.runtimeType}");
  bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
  bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
  bool hasDigits = password.contains(new RegExp(r'[0-9]'));
  bool hasSpecialCharacters =
      password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  if ((hasSpecialCharacters && hasDigits && hasLowercase && hasUppercase) ||
      (password.length >= 12)) {
    return PASSWORDSTRENGTH.STRONG;
  }
  if ((hasDigits || hasLowercase || hasUppercase) && (password.length >= 10)) {
    return PASSWORDSTRENGTH.AVERAGE;
  }
  if (hasDigits || hasLowercase || hasUppercase) {
    return PASSWORDSTRENGTH.WEAK;
  }
  return null;
}

enum PASSWORDSTRENGTH { WEAK, AVERAGE, STRONG }

bool isEmpty(String value) {
  return value == null || value.length < 1 || value.toLowerCase() == "null";
}

///  Method to nullify an empty String.
///  [value] - A string we want to be sure to keep null if empty
///  Returns null if a value is empty or null, otherwise, returns the value
String nullify(String value) {
  if (isEmpty(value)) {
    return null;
  }
  return value;
}
