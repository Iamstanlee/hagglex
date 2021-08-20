import 'package:json_annotation/json_annotation.dart';
part 'signup_req.g.dart';

@JsonSerializable()
class SignupRequest {
  SignupRequest({
    this.email,
    this.password,
    this.username,
    this.country,
    this.currency,
    this.phonenumber,
    this.referralCode,
  });
  String email,
      password,
      username,
      phonenumber,
      referralCode,
      country,
      currency;

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
