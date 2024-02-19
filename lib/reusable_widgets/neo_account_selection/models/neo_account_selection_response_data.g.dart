// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_account_selection_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoAccountSelectionResponseData _$NeoAccountSelectionResponseDataFromJson(
        Map<String, dynamic> json) =>
    NeoAccountSelectionResponseData(
      accountType:
          $enumDecodeNullable(_$NeoAccountTypeEnumMap, json['accountType']),
      accountSubType: $enumDecodeNullable(
          _$NeoAccountSubTypeEnumMap, json['accountSubType']),
      accountInternetName: json['accountInternetName'] as String?,
      balance: json['balance'] == null
          ? null
          : NeoAccountBalance.fromJson(json['balance'] as Map<String, dynamic>),
      number: json['number'] as String?,
      suffix: json['suffix'] as String?,
      iban: json['iban'] as String?,
      name: json['name'] as String?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$NeoAccountSelectionResponseDataToJson(
        NeoAccountSelectionResponseData instance) =>
    <String, dynamic>{
      'iban': instance.iban,
      'order': instance.order,
    };

const _$NeoAccountTypeEnumMap = {
  NeoAccountType.checking: 'checking',
  NeoAccountType.saving: 'saving',
};

const _$NeoAccountSubTypeEnumMap = {
  NeoAccountSubType.funded: 'MEVDFON',
  NeoAccountSubType.checking: 'VDSZMVD',
  NeoAccountSubType.on: 'VDLGLDR',
  NeoAccountSubType.exchangeRateProtected: 'VDLDOVE',
  NeoAccountSubType.foreignCurrencyExchangeRateProtected: 'VDLTLDE',
  NeoAccountSubType.saving: 'VDLMEVD',
};
