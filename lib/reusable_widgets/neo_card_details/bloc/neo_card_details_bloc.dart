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

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/bloc/neo_card_details_event.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/bloc/neo_card_details_state.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/model/neo_account_details_response_data.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/network/neo_card_details_network_manager.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_item_data.dart';
import 'package:neo_core/core/network/models/neo_response.dart';
import 'package:rxdart/rxdart.dart';

class NeoCardDetailsBloc extends Bloc<NeoCardDetailsEvent, NeoCardDetailsState> {
  final NeoCardDetailsNetworkManager networkManager;
  final cardDetailsStream = BehaviorSubject<NeoDebitCardItemData>();
  final accountDetailsStream = BehaviorSubject<NeoAccountDetailsResponseData>();

  NeoCardDetailsBloc({required this.networkManager}) : super(const NeoCardDetailsState()) {
    on<NeoCardDetailsEventFetchCardDetails>(_onFetchCardDetails);
  }

  Future<void> _onFetchCardDetails(
    NeoCardDetailsEventFetchCardDetails event,
    Emitter<NeoCardDetailsState> emit,
  ) async {
    try {
      final response = await networkManager.fetchCardDetails();
      if (response.isSuccess) {
        final NeoDebitCardItemData cardDetails = NeoDebitCardItemData.fromJson((response as NeoSuccessResponse).data);
        cardDetailsStream.add(cardDetails);
      } else {
        //TODO: handle error
      }
    } on Exception catch (_) {
      //TODO: handle exception
    }
  }

  @override
  Future<void> close() {
    cardDetailsStream.close();
    accountDetailsStream.close();
    return super.close();
  }
}
