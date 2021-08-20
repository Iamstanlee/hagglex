import 'package:hagglex/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_res.g.dart';

@JsonSerializable()
class UserResp {
  UserResp(this.user, this.token);
  final User user;
  final String token;

  factory UserResp.fromJson(Map<String, dynamic> json) =>
      _$UserRespFromJson(json);
  Map<String, dynamic> toJson() => _$UserRespToJson(this);
}
