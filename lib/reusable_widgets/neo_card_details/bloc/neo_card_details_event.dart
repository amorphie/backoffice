/*
 * 
 * neo_bank
 * 
 * Created on 26/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:equatable/equatable.dart';

sealed class NeoCardDetailsEvent extends Equatable {
  const NeoCardDetailsEvent();
}

class NeoCardDetailsEventFetchCardDetails extends NeoCardDetailsEvent {
  const NeoCardDetailsEventFetchCardDetails();

  @override
  List<Object?> get props => [];
}
