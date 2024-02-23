// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_account_details_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoAccountDetailsResponseData _$NeoAccountDetailsResponseDataFromJson(
        Map<String, dynamic> json) =>
    NeoAccountDetailsResponseData(
      accountSubType: $enumDecodeNullable(
          _$NeoAccountSubTypeEnumMap, json['accountSubType']),
      balance: json['balance'] == null
          ? null
          : NeoAccountBalance.fromJson(json['balance'] as Map<String, dynamic>),
      branch: json['branch'] == null
          ? null
          : NeoAccountBranch.fromJson(json['branch'] as Map<String, dynamic>),
    );

const _$NeoAccountSubTypeEnumMap = {
  NeoAccountSubType.funded: 'MEVDFON',
  NeoAccountSubType.checking: 'VDSZMVD',
  NeoAccountSubType.on: 'VDLGLDR',
  NeoAccountSubType.exchangeRateProtected: 'VDLDOVE',
  NeoAccountSubType.foreignCurrencyExchangeRateProtected: 'VDLTLDE',
  NeoAccountSubType.saving: 'VDLMEVD',
};
