import 'package:json_annotation/json_annotation.dart';
part 'loginReq.g.dart';

@JsonSerializable()
class LoginRequest {
  LoginRequest({this.input, this.password});
  String input, password;
  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
