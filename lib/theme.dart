import 'package:flutter/material.dart';
import 'package:hagglex/utils/res.dart';

const _regular = FontWeight.w400;
const _bold = FontWeight.w700;
const _light = FontWeight.w300;

TextTheme _textTheme = TextTheme(
  headline1: TextStyle(fontWeight: _bold, fontSize: 40.0),
  headline2: TextStyle(fontWeight: _bold, fontSize: 36.0),
  headline3: TextStyle(fontWeight: _bold, fontSize: 32.0),
  headline4: TextStyle(fontWeight: _bold, fontSize: 28.0),
  headline5: TextStyle(fontWeight: _regular, fontSize: 24.0),
  headline6: TextStyle(fontWeight: _bold, fontSize: 20.0),
  subtitle1: TextStyle(fontWeight: _bold, fontSize: 16.0),
  subtitle2: TextStyle(fontWeight: _bold, fontSize: 12.0),
  caption: TextStyle(fontWeight: _light, fontSize: 12.0),
  bodyText1: TextStyle(fontWeight: _bold, fontSize: 16.0),
  bodyText2: TextStyle(fontWeight: _regular, fontSize: 14.0),
  overline: TextStyle(fontWeight: _light, fontSize: 10.0),
  button: TextStyle(fontWeight: _bold, fontSize: 12.0),
);

ThemeData baseTheme(BuildContext context) => ThemeData(
    primaryColor: R.Colors.primaryColor,
    scaffoldBackgroundColor: R.Colors.scaffoldColor,
    fontFamily: R.Strings.primaryFont,
    textTheme: _textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
            elevation: 2.0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            primary: R.Colors.orangeColor,
            onPrimary: R.Colors.elevatedBtnTextColor)),
    inputDecorationTheme: InputDecorationTheme());

ThemeData theme(BuildContext context) =>
    baseTheme(context).copyWith(brightness: Brightness.light);

ThemeData darkTheme(BuildContext context) => baseTheme(context).copyWith();
