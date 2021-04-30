import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

GraphQLClient clientFor({
  @required String uri,
  String subscriptionUri,
}) {
  Link link = HttpLink(uri);
  if (subscriptionUri != null) {
    final WebSocketLink websocketLink = WebSocketLink(
      subscriptionUri,
      config: SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: Duration(seconds: 30),
      ),
    );

    link = link.concat(websocketLink);
  }

  return GraphQLClient(
    cache: new GraphQLCache(),
    link: link,
  );
}
