import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_core/neo_core.dart';
import 'package:rxdart/rxdart.dart';

import '../network/neo_search_network_manager.dart';
import 'neo_search_page_event.dart';
import 'neo_search_page_state.dart';

class NeoSearchPageViewBloc extends Bloc<NeoSearchPageEvent, NeoSearchPageState> {
  final NeoSearchNetworkManager networkManager;
  final itemListStream = BehaviorSubject<List>();
  final String workflowName;

  NeoSearchPageViewBloc({required this.networkManager, required this.workflowName}) : super(const NeoSearchPageListViewState()) {
    on<NeoSearchPageListViewEventFetchItemList>((event, emit) async {
      try {
        final response = await networkManager.fetchItemList(workflowName);
        if (response.isSuccess) {
          final List itemList = (response as NeoSuccessResponse).data["data"];
          itemListStream.add(itemList);
        } else {
          //TODO: handle error
        }
      } on Exception catch (_) {
        //TODO: handle exception
        print(_);
      }
    });
  }
}
