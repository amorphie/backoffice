// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brg_phone_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrgPhoneNumber _$BrgPhoneNumberFromJson(Map<String, dynamic> json) =>
    BrgPhoneNumber(
      countryCode: json['countryCode'] as String,
      prefix: json['prefix'] as String,
      number: json['number'] as String,
    );

Map<String, dynamic> _$BrgPhoneNumberToJson(BrgPhoneNumber instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'prefix': instance.prefix,
      'number': instance.number,
    };
