import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hagglex/utils/res.dart';
import 'package:hagglex/utils/validators.dart';

enum InputMode { LIGHT, DARK }

class BaseTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final List<TextInputFormatter> inputFormatters;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final Widget suffixIcon;
  final String initialValue;
  final TextInputType keyboardType;
  final bool obscureText;
  final InputMode inputMode;
  final bool isRequired;

  BaseTextField(
      {this.labelText,
      this.hintText,
      this.inputFormatters,
      this.onSaved,
      this.validator,
      this.controller,
      this.initialValue,
      this.suffixIcon,
      this.keyboardType,
      this.inputMode,
      this.obscureText = false,
      this.isRequired = true})
      : super();

  @override
  Widget build(BuildContext context) {
    ThemeData t = Theme.of(context);
    var c = inputMode == InputMode.DARK ? Colors.black : Colors.white;
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      onSaved: onSaved,
      validator: isRequired ? validator : null,
      initialValue: initialValue,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: t.textTheme.bodyText2.copyWith(color: c),
      decoration: new InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: t.textTheme.bodyText2.copyWith(color: c),
          hintStyle: t.textTheme.bodyText2.copyWith(color: c),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          isDense: true,
          suffixIcon: suffixIcon ??
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 12.0),
                child: suffixIcon,
              ),
          border: UnderlineInputBorder(borderSide: BorderSide(color: c)),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: c)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: R.Colors.focusedTextFieldColor))),
    );
  }
}

class TextInputField extends BaseTextField {
  TextInputField(
      {@required FormFieldSetter<String> onSaved,
      String labelText,
      String hintText,
      Function(String) validator,
      InputMode inputMode,
      String initialValue,
      bool isRequired,
      TextInputType keyboardType})
      : super(
            labelText: labelText,
            hintText: hintText,
            onSaved: onSaved,
            isRequired: isRequired ?? true,
            initialValue: initialValue,
            validator: validator ?? validateField,
            inputMode: inputMode ?? InputMode.DARK,
            keyboardType: keyboardType ?? TextInputType.text);
}

/// passwordInputField
class PwInputField extends BaseTextField {
  PwInputField(
      {@required FormFieldSetter<String> onSaved,
      String labelText,
      String hintText,
      Function(String) validator,
      TextInputType keyboardType,
      bool obscureText,
      InputMode inputMode,
      Widget suffixIcon})
      : super(
            labelText: labelText,
            hintText: hintText,
            onSaved: onSaved,
            inputMode: inputMode ?? InputMode.DARK,
            obscureText: obscureText,
            suffixIcon: suffixIcon,
            validator: validator ?? validateField,
            keyboardType: keyboardType ?? TextInputType.text);
}
