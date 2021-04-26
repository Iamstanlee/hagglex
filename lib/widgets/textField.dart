import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hagglex/utils/res.dart';

class BaseTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final List<TextInputFormatter> inputFormatters;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final String initialValue;
  final TextInputType keyboardType;

  BaseTextField(
      {this.labelText,
      this.hintText,
      this.inputFormatters,
      this.onSaved,
      this.validator,
      this.controller,
      this.initialValue,
      this.keyboardType = TextInputType.number})
      : super();

  @override
  Widget build(BuildContext context) {
    ThemeData t = Theme.of(context);

    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      onSaved: onSaved,
      validator: validator,
      initialValue: initialValue,
      keyboardType: keyboardType,
      style: t.textTheme.bodyText2.copyWith(color: Colors.white),
      decoration: new InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: t.textTheme.bodyText2.copyWith(color: Colors.white),
          hintStyle: t.textTheme.bodyText2.copyWith(color: Colors.white),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          isDense: true,
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: R.Colors.focusedTextFieldColor))),
    );
  }
}

class TextInputField extends BaseTextField {
  TextInputField(
      {@required FormFieldSetter<String> onSaved,
      @required Widget suffix,
      String labelText,
      String hintText,
      TextInputType keyboardType})
      : super(
            labelText: labelText,
            hintText: hintText,
            onSaved: onSaved,
            keyboardType: keyboardType ?? TextInputType.text);

  static String validateField(String fieldValue) {
    return fieldValue.isNotEmpty ? null : R.Strings.fieldReq;
  }
}
