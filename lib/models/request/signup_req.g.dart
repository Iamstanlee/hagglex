// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) {
  return SignupRequest(
    email: json['email'] as String,
    password: json['password'] as String,
    username: json['username'] as String,
    country: json['country'] as String,
    currency: json['currency'] as String,
    phonenumber: json['phonenumber'] as String,
    referralCode: json['referralCode'] as String,
  );
}

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
      'phonenumber': instance.phonenumber,
      'referralCode': instance.referralCode,
      'country': instance.country,
      'currency': instance.currency,
    };
