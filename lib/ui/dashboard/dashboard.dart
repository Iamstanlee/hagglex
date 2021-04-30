import 'package:flutter/material.dart';
import 'package:hagglex/ui/login/loginViewModel.dart';
import 'package:hagglex/utils/api.dart';
import 'package:hagglex/utils/spacing.dart';
import 'package:hagglex/widgets/busy.dart';
import 'package:hagglex/widgets/elevatedButton.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = context.watch<LoginViewModel>();
    return Busy(
      busy: loginViewModel.response.status == Status.LOADING,
      msg: "Logging out...",
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text("DASHBOARD",
                    style: Theme.of(context).textTheme.headline6)),
            VSpacing.md,
            Padding(
                padding: EdgeInsets.all(kHorizontalPadding),
                child: Elevatedbtn('LOG OUT', onTap: () {
                  loginViewModel.logoutUser(context);
                }))
          ],
        ),
      ),
    );
  }
}
