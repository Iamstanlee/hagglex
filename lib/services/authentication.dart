import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hagglex/models/country.dart';
import 'package:hagglex/models/request/loginReq.dart';
import 'package:hagglex/models/response/loginResp.dart';
import 'package:hagglex/services/sharedPreference.dart';
import 'package:hagglex/utils/api.dart';
import 'package:hagglex/utils/helpers.dart';

class AuthServiceImpl implements AuthService {
  @override
  Future<LoginResp> login(LoginRequest loginRequest) async {
    final String documentNode = """
      mutation login(\$data: LoginInput! ){
        login(data:\$data) {
            user {
                _id
                username
                phonenumber
                email
                phoneNumberVerified
            }
            token
        }
    }
      """;
    final MutationOptions options = MutationOptions(
      document: gql(documentNode),
      variables: <String, dynamic>{"data": loginRequest.toJson()},
    );
    final QueryResult res = await getIt<GraphQLClient>().mutate(options);
    if (res.hasException) throwOperationError(res.exception);
    return LoginResp.fromJson(res.data['login']);
  }

  @override
  Future<List<Country>> fetchActiveCountries() async {
    final String documentNode = """
    query GetActiveCountris {
        getActiveCountries {
            _id
            name,
            callingCode
            flag
        }
    }  
    """;
    final QueryOptions options = QueryOptions(document: gql(documentNode));
    final QueryResult res = await getIt<GraphQLClient>().query(options);
    if (res.hasException) throwOperationError(res.exception);
    var countries = res.data['getActiveCountries'] as List;
    print(countries);
    return countries.map((country) => Country.fromJson(country)).toList();
  }

  Future<Null> logout() async {
    await getIt<SharedPrefService>().flush();
  }
}

abstract class AuthService {
  Future<LoginResp> login(LoginRequest loginRequest);
  Future<List<Country>> fetchActiveCountries();
}
