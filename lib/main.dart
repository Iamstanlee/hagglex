import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hagglex/services/authentication.dart';
import 'package:hagglex/theme.dart';
import 'package:hagglex/ui/login/login.dart';
import 'package:hagglex/ui/login/loginViewModel.dart';
import 'package:hagglex/utils/constants.dart';
import 'package:hagglex/utils/helpers.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
// setup service locators
  setupLocator();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(HaggleX()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class HaggleX extends StatelessWidget {
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
          home: LoginPage(),
          debugShowCheckedModeBanner: false),
    );
  }
}
