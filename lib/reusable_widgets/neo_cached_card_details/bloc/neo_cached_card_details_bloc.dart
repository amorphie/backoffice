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

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_key.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_manager.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_type.dart';
import 'package:backoffice/util/neo_util.dart';

part 'neo_cached_card_details_event.dart';
part 'neo_cached_card_details_state.dart';

class NeoCachedCardDetailsBloc extends Bloc<NeoCachedCardDetailsEvent, NeoCachedCardDetailsState> {
  NeoCachedCardDetailsBloc() : super(const NeoCachedCardDetailsState()) {
    on<NeoCachedCardDetailsEventFetchCardDetails>((event, emit) {
      final NeoDebitCardType? cardType = GetIt.I<NeoParameterManager>().readFromCache(NeoParameterKey.debitCardTypeCachedKey);
      final String? cardId = GetIt.I<NeoParameterManager>().readFromCache(NeoParameterKey.debitCardIdCachedKey);
      final String? cardStatusCode = GetIt.I<NeoParameterManager>().readFromCache(NeoParameterKey.debitCardStatusCodeCachedKey);

      emit(
        state.copyWith(
          cardNumber: cardId.orEmpty,
          cardName: cardType?.getCardName(),
          cardImageUrn: cardType?.getCardImageUrn(),
          cardStatusCode: cardStatusCode.orEmpty,
        ),
      );
    });
  }
}
