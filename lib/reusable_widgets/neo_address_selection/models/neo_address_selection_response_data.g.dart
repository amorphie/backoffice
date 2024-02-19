// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_address_selection_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoAddressSelectionResponseData _$NeoAddressSelectionResponseDataFromJson(
        Map<String, dynamic> json) =>
    NeoAddressSelectionResponseData(
      cityCode: json['cityCode'] as int?,
      cityName: json['cityName'] as String?,
      townCode: json['townCode'] as int?,
      townName: json['townName'] as String?,
      districtName: json['districtName'] as String?,
      streetName: json['streetName'] as String?,
      addressType: json['addressType'] as int? ?? 1,
      addressDetail: json['addressDetail'] as String?,
      fullAddressInfo: json['fullAddressInfo'] as String?,
      type: json['type'] as String?,
      addressIconUrn: json['addressIconUrn'] as String?,
    );

Map<String, dynamic> _$NeoAddressSelectionResponseDataToJson(
        NeoAddressSelectionResponseData instance) =>
    <String, dynamic>{
      'cityCode': instance.cityCode,
      'cityName': instance.cityName,
      'townCode': instance.townCode,
      'townName': instance.townName,
      'districtName': instance.districtName,
      'streetName': instance.streetName,
      'addressType': instance.addressType,
      'addressDetail': instance.addressDetail,
      'fullAddressInfo': instance.fullAddressInfo,
    };
