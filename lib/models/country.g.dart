// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    json['_id'] as String,
    json['flag'] as String,
    json['callingCode'] as String,
    json['name'] as String,
    json['currencyCode'] as String,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'callingCode': instance.callingCode,
      'flag': instance.flag,
      'currencyCode': instance.currencyCode,
    };
