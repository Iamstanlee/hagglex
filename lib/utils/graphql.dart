import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hagglex/services/sharedPreference.dart';
import 'package:hagglex/utils/constants.dart';
import 'package:hagglex/utils/helpers.dart';

GraphQLClient clientFor({@required String uri, String token}) {
  final Link httpLink = HttpLink(uri);
  final AuthLink authLink = AuthLink(
    getToken: () => "Bearer ${getIt<SharedPrefService>().token}",
  );

  final Link link = authLink.concat(httpLink);
  return GraphQLClient(
    cache: new GraphQLCache(),
    link: link,
  );
}

final client = clientFor(uri: Constants.GQL_CLIENT);
