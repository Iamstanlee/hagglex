import 'package:json_annotation/json_annotation.dart';
part 'country.g.dart';

@JsonSerializable()
class Country {
  Country(this.id, this.flag, this.callingCode, this.name, this.currencyCode);

  @JsonKey(name: "_id")
  String id;
  final String name, callingCode, flag, currencyCode;
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
