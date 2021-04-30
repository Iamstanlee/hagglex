import 'package:json_annotation/json_annotation.dart';
part 'country.g.dart';

@JsonSerializable()
class Country {
  Country(this.id, this.flag, this.callingCode, this.name);

  @JsonKey(name: "_id")
  String id;
  final String name, callingCode, flag;
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
