import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hagglex/services/preference.dart';
import 'package:hagglex/utils/constants.dart';
import 'package:hagglex/utils/helpers.dart';

GraphQLClient clientFor({@required String uri}) {
  final Link httpLink = HttpLink(uri);
  final AuthLink authLink = AuthLink(
    getToken: () => "Bearer ${getIt<PrefsService>().token}",
  );

  final Link link = authLink.concat(httpLink);
  return GraphQLClient(
    cache: new GraphQLCache(),
    link: link,
  );
}

final client = clientFor(uri: Constants.API_URL);
