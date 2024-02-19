import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_key.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_manager.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card_list_view/bloc/neo_debit_card_list_view_event.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card_list_view/bloc/neo_debit_card_list_view_state.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card_list_view/network/neo_debit_card_list_view_network_manager.dart';
import 'package:backoffice/util/app_constants.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/network/models/neo_response.dart';
import 'package:rxdart/rxdart.dart';

class NeoDebitCardListViewBloc extends Bloc<NeoDebitCardListViewEvent, NeoDebitCardListViewState> {
  final NeoDebitCardListViewNetworkManager networkManager;
  final itemListStream = BehaviorSubject<List<NeoDebitCardItemData>>();

  NeoDebitCardListViewBloc({required this.networkManager}) : super(const NeoDebitCardListViewState()) {
    on<NeoDebitCardListViewEventFetchItemList>((event, emit) async {
      /// Delete cached card data
      _deleteCachedCardData();
      try {
        final response = await networkManager.fetchItemList();
        if (response.isSuccess) {
          final List<NeoDebitCardItemData> itemList =
              (response as NeoSuccessResponse).data[AppConstants.responseDataKey].map<NeoDebitCardItemData>((e) => NeoDebitCardItemData.fromJson(e)).toList();
          if (!itemListStream.isClosed) {
            itemListStream.add(itemList);
          }
        } else {
          //TODO: handle error
        }
      } on Exception catch (_) {
        //TODO: handle exception
      }
    });
  }

  void _deleteCachedCardData() {
    GetIt.I<NeoParameterManager>().deleteFromCache(NeoParameterKey.debitCardNameCachedKey);
    GetIt.I<NeoParameterManager>().deleteFromCache(NeoParameterKey.debitCardIdCachedKey);
    GetIt.I<NeoParameterManager>().deleteFromCache(NeoParameterKey.debitCardTypeCachedKey);
    GetIt.I<NeoParameterManager>().deleteFromCache(NeoParameterKey.debitCardStatusCodeCachedKey);
  }

  @override
  Future<void> close() {
    itemListStream.close();
    return super.close();
  }
}
