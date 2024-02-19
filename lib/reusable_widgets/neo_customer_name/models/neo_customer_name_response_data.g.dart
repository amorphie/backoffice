// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_customer_name_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoCustomerNameResponseData _$NeoCustomerNameResponseDataFromJson(
        Map<String, dynamic> json) =>
    NeoCustomerNameResponseData(
      firstLines: (json['firstLines'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$NeoCustomerNameResponseDataToJson(
        NeoCustomerNameResponseData instance) =>
    <String, dynamic>{
      'firstLines': instance.firstLines,
    };
