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

sealed class NeoCachedCardDetailsEvent extends Equatable {
  const NeoCachedCardDetailsEvent();
}

class NeoCachedCardDetailsEventFetchCardDetails extends NeoCachedCardDetailsEvent {
  const NeoCachedCardDetailsEventFetchCardDetails();

  @override
  List<Object?> get props => [];
}
