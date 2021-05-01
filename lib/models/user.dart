import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  User(this.email, this.id, this.phoneNumberVerified, this.phonenumber,
      this.username, this.emailVerified);

  @JsonKey(name: "_id")
  String id;
  final String username, phonenumber, email;
  final bool phoneNumberVerified, emailVerified;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
