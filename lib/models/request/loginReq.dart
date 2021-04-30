import 'package:json_annotation/json_annotation.dart';
part 'loginReq.g.dart';

@JsonSerializable()
class LoginRequest {
  LoginRequest({this.input, this.password});
  String input, password;
  bool get isRequired => this.input?.length == 0 && this.password?.length == 0;
  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
