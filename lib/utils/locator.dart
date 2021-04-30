import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hagglex/services/authentication.dart';
import 'package:hagglex/services/sharedPreference.dart';
import 'package:hagglex/utils/constants.dart';
import 'package:hagglex/utils/graphql.dart';

final getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingletonAsync<SharedPrefService>(
      () async => SharedPrefService().init());
  getIt.registerLazySingleton<GraphQLClient>(
      () => clientFor(uri: Constants.GQL_CLIENT));
  getIt.registerLazySingleton<AuthServiceImpl>(() => AuthServiceImpl());
}
