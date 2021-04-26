import 'package:flutter/material.dart';
import 'package:hagglex/theme.dart';
import 'package:hagglex/ui/signup/signup.dart';
import 'package:hagglex/utils/extensions.dart';
import 'package:hagglex/utils/helpers.dart';
import 'package:hagglex/utils/res.dart';
import 'package:hagglex/utils/spacing.dart';
import 'package:hagglex/widgets/elevatedButton.dart';
import 'package:hagglex/widgets/textField.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData t = Theme.of(context);

    return Scaffold(
      backgroundColor: R.Colors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: context.getHeight(factor: 0.2), bottom: 28),
                child: Text("Welcome!",
                    style: t.textTheme.headline1.copyWith(color: Colors.white)),
              ),
              VSpacing.xl,
              TextInputField(
                  labelText: "Email Address",
                  hintText: "Enter your email address or username",
                  onSaved: (value) {}),
              VSpacing.xl,
              TextInputField(
                  labelText: "Password",
                  hintText: "Password (Min. 8 characters)",
                  onSaved: (value) {}),
              VSpacing.xl,
              Padding(
                padding: EdgeInsets.only(bottom: 14, top: 10.0),
                child: Text("Forgot Password?",
                    textAlign: TextAlign.right,
                    style: t.textTheme.caption.copyWith(color: Colors.white)),
              ),
              VSpacing.xl,
              Elevatedbtn("LOG IN", onTap: () {}),
              VSpacing.xl,
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    push<String>(context, route: Signup());
                  },
                  child: Text("New user? Create a new account",
                      textAlign: TextAlign.center,
                      style:
                          t.textTheme.bodyText2.copyWith(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
