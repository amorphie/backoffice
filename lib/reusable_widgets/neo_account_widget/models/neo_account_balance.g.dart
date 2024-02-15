// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_account_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoAccountBalance _$NeoAccountBalanceFromJson(Map<String, dynamic> json) =>
    NeoAccountBalance(
      credits: (json['credits'] as List<dynamic>?)
              ?.map((e) => NeoAccountCredit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      availableBalance: (json['availableBalance'] as num?)?.toDouble(),
      availableBalanceNonCredit:
          (json['availableBalanceNonCredit'] as num?)?.toDouble(),
      balance: (json['balance'] as num?)?.toDouble(),
      currencyCode: json['currencyCode'] as String?,
    );

Map<String, dynamic> _$NeoAccountBalanceToJson(NeoAccountBalance instance) =>
    <String, dynamic>{
      'availableBalance': instance.availableBalance,
      'availableBalanceNonCredit': instance.availableBalanceNonCredit,
      'balance': instance.balance,
      'currencyCode': instance.currencyCode,
      'credits': instance.credits,
    };
