import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  User(this.email, this.id, this.phoneNumberVerified, this.phonenumber,
      this.username);

  @JsonKey(name: "_id")
  String id;
  String username;
  String phonenumber;
  String email;
  bool phoneNumberVerified;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
