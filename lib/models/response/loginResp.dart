import 'package:hagglex/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'loginResp.g.dart';

@JsonSerializable()
class LoginResp {
  LoginResp();
  User user;
  String token;

  factory LoginResp.fromJson(Map<String, dynamic> json) =>
      _$LoginRespFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRespToJson(this);
}
