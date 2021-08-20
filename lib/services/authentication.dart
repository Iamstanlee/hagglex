import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hagglex/models/country.dart';
import 'package:hagglex/models/request/login_req.dart';
import 'package:hagglex/models/request/signup_req.dart';
import 'package:hagglex/models/response/user_res.dart';
import 'package:hagglex/services/preference.dart';
import 'package:hagglex/utils/api.dart';
import 'package:hagglex/utils/graphql.dart';
import 'package:hagglex/utils/helpers.dart';

class GraphQlAuth implements AuthService {
  @override
  Future<UserResp> login(LoginRequest loginRequest) async {
    final String documentNode = """
      mutation Login(\$data: LoginInput! ){
        login(data:\$data) {
            user {
                _id
                username
                phonenumber
                email
                emailVerified
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
    final QueryResult res = await client.mutate(options);
    if (res.hasException) throwOperationError(res.exception);
    return UserResp.fromJson(res.data['login']);
  }

  @override
  Future<UserResp> signup(SignupRequest signupRequest) async {
    final String documentNode = """
      mutation Signup(\$data: CreateUserInput! ){
        register(data:\$data) {
            user {
                _id
                username
                phonenumber
                email
                emailVerified
                phoneNumberVerified
            }
            token
        }
    }
      """;
    final MutationOptions options = MutationOptions(
      document: gql(documentNode),
      variables: <String, dynamic>{"data": signupRequest.toJson()},
    );
    final QueryResult res = await client.mutate(options);
    if (res.hasException) throwOperationError(res.exception);
    return UserResp.fromJson(res.data['register']);
  }

  @override
  Future<UserResp> verify(int code) async {
    final String documentNode = """
        mutation Verify(\$data: VerifyUserInput! ) {
            verifyUser(data:\$data) {
             user {
                _id
                username
                phonenumber
                email
                emailVerified
                phoneNumberVerified
            }
            token
        }
    }
      """;
    final MutationOptions options = MutationOptions(
      document: gql(documentNode),
      variables: <String, dynamic>{
        "data": {"code": code}
      },
    );
    final QueryResult res = await client.mutate(options);
    if (res.hasException) throwOperationError(res.exception);
    return UserResp.fromJson(res.data['verifyUser']);
  }

  @override
  Future<bool> resendCode(String email) async {
    final String documentNode = """
        query rc(\$data:EmailInput) {
            resendVerificationCode(data:\$data)
    } 
    """;
    final QueryOptions options = QueryOptions(
      document: gql(documentNode),
      variables: <String, dynamic>{
        "data": {"email": email}
      },
    );
    final QueryResult res = await client.query(options);
    if (res.hasException) throwOperationError(res.exception);
    var rc = res.data['resendVerificationCode'] as bool;
    return rc;
  }

  @override
  Future<List<Country>> fetchActiveCountries() async {
    final String documentNode = """
    query GetActiveCountries {
        getActiveCountries {
            _id
            name,
            callingCode
            currencyCode
            flag
        }
    }  
    """;
    final QueryOptions options = QueryOptions(document: gql(documentNode));
    final QueryResult res = await client.query(options);
    if (res.hasException) throwOperationError(res.exception);
    var countries = res.data['getActiveCountries'] as List;
    return countries.map((country) => Country.fromJson(country)).toList();
  }

  Future<void> logout() async {
    await getIt<PrefsService>().flush();
  }
}

abstract class AuthService {
  Future<UserResp> login(LoginRequest loginRequest);
  Future<UserResp> signup(SignupRequest signupRequest);
  Future<UserResp> verify(int code);
  Future<bool> resendCode(String email);
  Future<List<Country>> fetchActiveCountries();
  Future<void> logout();
}
