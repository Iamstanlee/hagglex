import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hagglex/models/request/loginReq.dart';
import 'package:hagglex/models/response/loginResp.dart';
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
    if (res.hasException) {
      throw FetchDataException(res.exception.graphqlErrors[0].message);
    } else {
      return LoginResp.fromJson(res.data);
    }
  }
}

abstract class AuthService {
  Future<LoginResp> login(LoginRequest loginRequest);
}
