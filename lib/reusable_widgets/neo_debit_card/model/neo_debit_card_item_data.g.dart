// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_debit_card_item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoDebitCardItemData _$NeoDebitCardItemDataFromJson(
        Map<String, dynamic> json) =>
    NeoDebitCardItemData(
      cardType: json['cardType'] as int? ?? 1,
      cardNumber: json['cardNumber'] as String?,
      issuedToName: json['issuedToName'] as String?,
      type: json['type'] as int?,
      masterAccount: json['masterAccount'] == null
          ? null
          : NeoDebitCardItemDataMasterAccount.fromJson(
              json['masterAccount'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String?,
      statusName: json['statusName'] as String?,
      embossName: json['embossName'] as String?,
      logoCode: json['logoCode'] as String?,
    );
