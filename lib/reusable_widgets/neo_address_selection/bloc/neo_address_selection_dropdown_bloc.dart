/*
 * 
 * neo_bank
 * 
 * Created on 19/01/2024.
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
import 'package:backoffice/reusable_widgets/neo_address_selection/models/neo_address_selection_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_address_selection/models/neo_address_selection_response_data.dart';
import 'package:backoffice/reusable_widgets/neo_address_selection/network/neo_address_selection_dropdown_network_manager.dart';
import 'package:backoffice/util/app_constants.dart';
import 'package:neo_core/neo_core.dart';

part 'neo_address_selection_dropdown_event.dart';
part 'neo_address_selection_dropdown_state.dart';

class NeoAddressSelectionDropdownBloc extends Bloc<NeoAddressSelectionDropdownEvent, NeoAddressSelectionDropdownState> {
  final NeoAddressSelectionDropdownNetworkManager networkManager;

  NeoAddressSelectionDropdownBloc({required this.networkManager}) : super(NeoAddressSelectionDropdownStateLoading()) {
    List<NeoAddressSelectionItemData> addressList = [];

    on<NeoAddressSelectionDropdownEventFetchAddressList>((event, emit) async {
      emit(NeoAddressSelectionDropdownStateLoading());
      try {
        final response = await networkManager.fetchAddressList();
        if (response.isSuccess) {
          addressList = (response as NeoSuccessResponse)
              .data[AppConstants.responseDataKey]
              .map<NeoAddressSelectionItemData>(
                (e) => NeoAddressSelectionItemData.fromNetworkData(NeoAddressSelectionResponseData.fromJson(e)),
              )
              .toList();
          emit(NeoAddressSelectionDropdownStateLoaded(addressList: addressList));
        } else {
          // TODO: Handle error if necessary
        }
      } on Exception catch (e) {
        // TODO: Handle error if necessary
        emit(NeoAddressSelectionDropdownStateError(e.toString()));
      }
    });
  }
}
