// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_debit_card_item_data_master_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoDebitCardItemDataMasterAccount _$NeoDebitCardItemDataMasterAccountFromJson(
        Map<String, dynamic> json) =>
    NeoDebitCardItemDataMasterAccount(
      iban: json['iban'] as String?,
      number: json['number'] as int?,
      branch: json['branch'] as int?,
      suffix: json['suffix'] as int?,
      currency: json['currency'] as String?,
      balance: (json['balance'] as num?)?.toDouble(),
      accountDetails: json['accountDetails'] == null
          ? null
          : NeoAccountDetailsResponseData.fromJson(
              json['accountDetails'] as Map<String, dynamic>),
      transactionLimits: (json['transactionLimits'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NeoTransactionsLimitsResponseData.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );
