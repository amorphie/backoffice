import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_core/neo_core.dart';
import 'package:rxdart/rxdart.dart';

import '../network/neo_search_network_manager.dart';
import 'neo_search_page_event.dart';
import 'neo_search_page_state.dart';

class NeoSearchPageViewBloc extends Bloc<NeoSearchPageEvent, NeoSearchPageState> {
  final NeoSearchNetworkManager networkManager;
  final itemList = <Map<String, dynamic>>[];
  final String workflowName;

  NeoSearchPageViewBloc({required this.networkManager, required this.workflowName}) : super(const NeoSearchPageListViewStateLoading()) {
    on<NeoSearchPageListViewEventFetchItemList>((event, emit) async {
      try {
        emit(const NeoSearchPageListViewStateLoading());
        final response = await networkManager.fetchItemList(workflowName);
        if (response.isSuccess) {
          for (var item in (response as NeoSuccessResponse).data["data"]) {
            itemList.add(item);
          }
          emit(NeoSearchPageListViewStateLoaded(itemList: itemList));
        } else {
          emit(const NeoSearchPageListViewStateError());
        }
      } on Exception catch (_) {
        emit(const NeoSearchPageListViewStateError());
      }
    });
    on<NeoSearchPageListViewSearchEvent>((event, emit) async {
      try {
        emit(const NeoSearchPageListViewStateLoading());

        final response = await networkManager.fetchItemList(workflowName, event.keyword);
        if (response.isSuccess) {
          List<Map<String, dynamic>> itemList = [];
          for (var item in (response as NeoSuccessResponse).data["data"]) {
            itemList.add(item);
          }
          emit(NeoSearchPageListViewStateLoaded(itemList: itemList));
        } else {
          emit(const NeoSearchPageListViewStateError());
        }
      } on Exception catch (_) {
        emit(const NeoSearchPageListViewStateError());
      }
    });
  }

  Map<String, dynamic> getItemBy(String value, [String key = "id"]) {
    return itemList.firstWhere((element) => element[key] == value);
  }
}
