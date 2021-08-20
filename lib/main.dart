import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hagglex/services/preference.dart';
import 'package:hagglex/theme.dart';
import 'package:hagglex/ui/dashboard/dashboard.dart';
import 'package:hagglex/ui/login/login.dart';
import 'package:hagglex/ui/login/login_viewmodel.dart';
import 'package:hagglex/ui/signup/signup_viewmodel.dart';
import 'package:hagglex/utils/constants.dart';
import 'package:hagglex/utils/helpers.dart';
import 'package:provider/provider.dart';

// TODO: write more tests
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// setup service locators
  setupLocator();
  final home = await decideIndexWidget();
  runApp(HaggleX(home));
}

/// check if an auth token is stored on the device
/// and use it to decide the first page
/// the user would see when the app loads
Future<Widget> decideIndexWidget() async {
  final _prefs = getIt<PrefsService>();
  await _prefs.init();
  return _prefs.token.isEmpty ? LoginPage() : DashboardPage();
}

class HaggleX extends StatelessWidget {
  final Widget home;
  HaggleX(this.home);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => SignupViewModel())
      ],
      child: MaterialApp(
        title: Constants.APP_NAME,
        theme: theme,
        home: home,
        navigatorKey: navigator,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
