import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_account_selection/models/neo_account_selection_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_account_selection/models/neo_account_selection_response_data.dart';
import 'package:backoffice/reusable_widgets/neo_account_selection/network/neo_account_selection_dropdown_network_manager.dart';
import 'package:backoffice/util/app_constants.dart';
import 'package:neo_core/core/network/models/neo_response.dart';

part 'neo_account_selection_dropdown_event.dart';
part 'neo_account_selection_dropdown_state.dart';

class NeoAccountSelectionDropdownBloc extends Bloc<NeoAccountSelectionDropdownEvent, NeoAccountSelectionDropdownState> {
  final NeoAccountSelectionDropdownNetworkManager networkManager;

  NeoAccountSelectionDropdownBloc({required this.networkManager}) : super(NeoAccountSelectionDropdownStateLoading()) {
    List<NeoAccountSelectionItemData> accountList = [];

    on<NeoAccountSelectionDropdownEventFetchAccountList>((event, emit) async {
      emit(NeoAccountSelectionDropdownStateLoading());
      try {
        final response = await networkManager.fetchAccountList();
        if (response.isSuccess) {
          accountList = (response as NeoSuccessResponse)
              .data[AppConstants.responseDataKey]
              .map<NeoAccountSelectionItemData>(
                (e) => NeoAccountSelectionItemData.fromNetworkData(NeoAccountSelectionResponseData.fromJson(e)),
              )
              .toList();
          emit(NeoAccountSelectionDropdownStateLoaded(accountList: accountList));
        } else {
          // TODO: Handle error if necessary
        }
      } on Exception catch (e) {
        // TODO: Handle error if necessary
        emit(NeoAccountSelectionDropdownStateError(e.toString()));
      }
    });
  }
}
