import 'package:flutter/material.dart';
import 'package:hagglex/ui/signup/signupViewModel.dart';
import 'package:hagglex/utils/api.dart';
import 'package:hagglex/utils/res.dart';
import 'package:hagglex/utils/spacing.dart';
import 'package:hagglex/utils/validators.dart';
import 'package:hagglex/widgets/backButton.dart';
import 'package:hagglex/widgets/busy.dart';
import 'package:hagglex/widgets/gradientBtn.dart';
import 'package:hagglex/widgets/textField.dart';
import 'package:provider/provider.dart';
import 'package:hagglex/utils/extensions.dart';

class VerifyPhonePage extends StatefulWidget {
  // this email passed to the page would be used only
  // if no email was found in signupViewModel
  final String email;
  VerifyPhonePage({Key key, this.email}) : super(key: key);
  @override
  _VerifyPhonePageState createState() => _VerifyPhonePageState();
}

class _VerifyPhonePageState extends State<VerifyPhonePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ThemeData t = Theme.of(context);
    SignupViewModel signupViewModel = context.watch<SignupViewModel>();

    return Busy(
      busy: signupViewModel.response.status == Status.LOADING,
      msg: signupViewModel.response.message,
      child: Scaffold(
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
                        bottom: VSpacing.md.height, left: HSpacing.sm.width),
                    child: BackBtn()),
                Padding(
                  padding: EdgeInsets.only(bottom: 14, top: 10, left: 10.0),
                  child: Text("Verify your account",
                      textAlign: TextAlign.center,
                      style:
                          t.textTheme.headline6.copyWith(color: Colors.white)),
                ),
                VSpacing.lg,
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
                          VSpacing.xxl,
                          Image.asset(R.Images.imCheck2, height: 64),
                          VSpacing.md,
                          Padding(
                            padding: EdgeInsets.only(bottom: 14, top: 10.0),
                            child: Text(
                                "We just sent a verification code to your email. Please enter the code",
                                textAlign: TextAlign.center,
                                style: t.textTheme.bodyText2),
                          ),
                          VSpacing.md,
                          TextInputField(
                              labelText: "Verification Code",
                              hintText: "Enter verification code",
                              onSaved: (value) {
                                signupViewModel.code = value.toInt();
                              }),
                          VSpacing.lg,
                          GradientBtn("VERIFY ME", onTap: () {
                            validateForm(formKey, next: () {
                              signupViewModel.verifyUser(context);
                            });
                          }),
                          VSpacing.md,
                          Padding(
                            padding: EdgeInsets.only(bottom: 14, top: 10.0),
                            child: Text("This code will expire in 10 minutes",
                                textAlign: TextAlign.center,
                                style: t.textTheme.bodyText2),
                          ),
                          VSpacing.lg,
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                signupViewModel.resendVerificationCode(
                                    context, widget.email);
                              },
                              child: Text("Resend Code",
                                  textAlign: TextAlign.center,
                                  style: t.textTheme.bodyText1.copyWith(
                                      decoration: TextDecoration.underline)),
                            ),
                          ),
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
      ),
    );
  }
}
