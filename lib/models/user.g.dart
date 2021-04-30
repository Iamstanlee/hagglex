// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['email'] as String,
    json['_id'] as String,
    json['phoneNumberVerified'] as bool,
    json['phonenumber'] as String,
    json['username'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'phonenumber': instance.phonenumber,
      'email': instance.email,
      'phoneNumberVerified': instance.phoneNumberVerified,
    };
