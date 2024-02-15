/*
 * 
 * neo_bank
 * 
 * Created on 29/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

part of 'neo_cached_card_details_bloc.dart';

class NeoCachedCardDetailsState extends Equatable {
  final String? cardNumber;
  final String? cardName;
  final String? cardImageUrn;
  final String? cardStatusCode;

  const NeoCachedCardDetailsState({this.cardNumber, this.cardName, this.cardImageUrn, this.cardStatusCode});

  @override
  List<Object?> get props => [cardNumber, cardName, cardImageUrn, cardStatusCode];

  NeoCachedCardDetailsState copyWith({
    String? cardNumber,
    String? cardName,
    String? cardImageUrn,
    String? cardStatusCode,
  }) {
    return NeoCachedCardDetailsState(
      cardNumber: cardNumber ?? this.cardNumber,
      cardName: cardName ?? this.cardName,
      cardImageUrn: cardImageUrn ?? this.cardImageUrn,
      cardStatusCode: cardStatusCode ?? this.cardStatusCode,
    );
  }
}
