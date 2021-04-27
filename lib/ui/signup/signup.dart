import 'package:flutter/material.dart';
import 'package:hagglex/ui/dashboard/dashboard.dart';
import 'package:hagglex/ui/signup/countryList.dart';
import 'package:hagglex/ui/signup/verifyPhone.dart';
import 'package:hagglex/ui/welcome/welcome.dart';
import 'package:hagglex/utils/extensions.dart';
import 'package:hagglex/utils/helpers.dart';
import 'package:hagglex/utils/res.dart';
import 'package:hagglex/utils/spacing.dart';
import 'package:hagglex/utils/validators.dart';
import 'package:hagglex/widgets/backButton.dart';
import 'package:hagglex/widgets/elevatedButton.dart';
import 'package:hagglex/widgets/gradientBtn.dart';
import 'package:hagglex/widgets/textField.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    ThemeData t = Theme.of(context);

    return Scaffold(
      backgroundColor: R.Colors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: HSpacing.md.width, vertical: VSpacing.xxl.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      bottom: VSpacing.xl.height, left: HSpacing.sm.width),
                  child: BackBtn()),
              Card(
                margin: EdgeInsets.only(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: HSpacing.xl.width),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: VSpacing.xxl.height),
                          child: Text("Create a new account",
                              style: t.textTheme.headline6),
                        ),
                        VSpacing.md,
                        TextInputField(
                            labelText: "Email Address",
                            hintText: "Enter your email address",
                            onSaved: (value) {}),
                        VSpacing.md,
                        PwInputField(
                            labelText: "Password",
                            hintText: "Password (Min. 8 characters)",
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
                            onSaved: (value) {}),
                        VSpacing.md,
                        TextInputField(
                            labelText: "Username",
                            hintText: "Create a username",
                            onSaved: (value) {}),
                        VSpacing.md,
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                push(context, route: CountryListPage());
                              },
                              child: Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      color: R.Colors.lightGrey,
                                      border: Border.all(
                                          color: Color(0xFF0000001A))),
                                  child: Row(
                                    children: [
                                      Image.asset(R.Images.imCheck, height: 24),
                                      HSpacing.xs,
                                      Text("(+234)")
                                    ],
                                  )),
                            ),
                            HSpacing.sm,
                            Expanded(
                                child: TextInputField(
                                    labelText: "Phone number",
                                    hintText: "Enter your phone number",
                                    onSaved: (value) {})),
                          ],
                        ),
                        VSpacing.md,
                        TextInputField(
                            labelText: "Referral code ( optional )",
                            hintText: "Enter referral code",
                            onSaved: (value) {}),
                        VSpacing.md,
                        Padding(
                          padding: EdgeInsets.only(bottom: 14, top: 10.0),
                          child: Text(
                              "By signing, you agree to HaggleX terms and privacy policy.",
                              textAlign: TextAlign.center,
                              style: t.textTheme.caption),
                        ),
                        VSpacing.md,
                        GradientBtn("SIGN UP", onTap: () {
                          push(context, route: VerifyPhonePage());
                          //   validateForm(formKey, next: () {
                          //     push(context, route: WelcomePage());
                          //   });
                        }),
                        VSpacing.xxl
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
