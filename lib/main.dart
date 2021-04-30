import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hagglex/services/authentication.dart';
import 'package:hagglex/services/sharedPreference.dart';
import 'package:hagglex/theme.dart';
import 'package:hagglex/ui/dashboard/dashboard.dart';
import 'package:hagglex/ui/login/login.dart';
import 'package:hagglex/ui/login/loginViewModel.dart';
import 'package:hagglex/utils/constants.dart';
import 'package:hagglex/utils/helpers.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// setup service locators
  setupLocator();

  var home = await decideIndexWidget();
  runZonedGuarded(
    () async => runApp(HaggleX(home: home)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

/// check if an auth token is stored on the device
/// and use it to decide the first page
/// the user would see when the app loads
Future<Widget> decideIndexWidget() async {
  await getIt<SharedPrefService>().init();
  return getIt<SharedPrefService>().token.length == 0
      ? LoginPage()
      : DashboardPage();
}

class HaggleX extends StatelessWidget {
  final Widget home;
  HaggleX({this.home});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => LoginViewModel(getIt<AuthServiceImpl>()))
      ],
      child: MaterialApp(
          title: Constants.APP_NAME,
          theme: theme(context),
          home: home,
          debugShowCheckedModeBanner: false),
    );
  }
}
