// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userResp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResp _$UserRespFromJson(Map<String, dynamic> json) {
  return UserResp(
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['token'] as String,
  );
}

Map<String, dynamic> _$UserRespToJson(UserResp instance) => <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };
