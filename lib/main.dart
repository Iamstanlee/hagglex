import 'package:flutter/material.dart';
import 'package:hagglex/theme.dart';
import 'package:hagglex/ui/login/login.dart';
import 'package:hagglex/utils/constants.dart';

void main() {
  runApp(HaggleX());
}

class HaggleX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: Constants.APP_NAME,
        theme: AppTheme().lightTheme,
        home: LoginPage(),
        debugShowCheckedModeBanner: false);
  }
}
