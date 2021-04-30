import 'package:flutter/material.dart';
import 'package:hagglex/models/request/loginReq.dart';
import 'package:hagglex/ui/dashboard/dashboard.dart';
import 'package:hagglex/ui/login/loginViewModel.dart';
import 'package:hagglex/ui/signup/signup.dart';
import 'package:hagglex/utils/extensions.dart';
import 'package:hagglex/utils/helpers.dart';
import 'package:hagglex/utils/res.dart';
import 'package:hagglex/utils/spacing.dart';
import 'package:hagglex/utils/validators.dart';
import 'package:hagglex/widgets/elevatedButton.dart';
import 'package:hagglex/widgets/textField.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    ThemeData t = Theme.of(context);
    LoginViewModel loginViewModel = context.watch<LoginViewModel>();
    return Material(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(R.Images.imBackground),
              fit: BoxFit.cover,
            )),
            height: context.getHeight(),
            child: SingleChildScrollView(
                child: Form(
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: context.getHeight(factor: 0.2),
                                bottom: 28),
                            child: Text("Welcome!",
                                style: t.textTheme.headline1
                                    .copyWith(color: Colors.white)),
                          ),
                          VSpacing.xl,
                          TextInputField(
                              labelText: "Email Address",
                              hintText: "Enter your email address or username",
                              inputMode: InputMode.LIGHT,
                              onSaved: (value) {
                                loginViewModel.loginRequest.input = value;
                              }),
                          VSpacing.xl,
                          PwInputField(
                              labelText: "Password",
                              hintText: "Password (Min. 8 characters)",
                              inputMode: InputMode.LIGHT,
                              obscureText: obscureText,
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  child: ImageIcon(
                                      AssetImage(obscureText
                                          ? R.Icons.icEye
                                          : R.Icons.icEyeOff),
                                      color: Colors.white)),
                              onSaved: (value) {
                                loginViewModel.loginRequest.password = value;
                              }),
                          VSpacing.xl,
                          Padding(
                            padding: EdgeInsets.only(bottom: 14, top: 10.0),
                            child: Text("Forgot Password?",
                                textAlign: TextAlign.right,
                                style: t.textTheme.caption
                                    .copyWith(color: Colors.white)),
                          ),
                          VSpacing.xl,
                          Elevatedbtn("LOG IN", onTap: () {
                            validateForm(formKey, next: () {
                              loginViewModel.loginUser(context);
                              //   push(context, route: DashboardPage(),popOFF: true);
                            });
                          }),
                          VSpacing.xl,
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            child: GestureDetector(
                              onTap: () {
                                push(context, route: SignupPage());
                              },
                              child: Text("New user? Create a new account",
                                  textAlign: TextAlign.center,
                                  style: t.textTheme.bodyText2
                                      .copyWith(color: Colors.white)),
                            ),
                          )
                        ])))));
  }
}
