import 'package:flutter/material.dart';
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
