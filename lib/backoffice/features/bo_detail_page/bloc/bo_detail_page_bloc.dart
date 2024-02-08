import 'package:backoffice/backoffice/features/bo_detail_page/network/neo_detail_network_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_core/neo_core.dart';

import 'bo_detail_page_event.dart';
import 'bo_detail_page_state.dart';

class BoDetailPageBloc extends Bloc<BoDetailPageEvent, BoDetailPageState> {
  final NeoDetailNetworkManager networkManager;
  final Map<String, dynamic> data;
  BoDetailPageBloc({required this.networkManager, required this.data}) : super(const BoDetailPageStateViewLoading()) {
    on<BoDetailPageEventSetItem>((event, emit) async {
      try {
        final response = await networkManager.getStateView(data["state"]["name"]);
        if (response.isSuccess) {
          emit(BoDetailPageStateViewLoaded(item: (response as NeoSuccessResponse).data));
        } else {
          emit(const BoDetailPageStateViewError());
        }
      } catch (e) {
        emit(const BoDetailPageStateViewError());
      }
    });
  }
}
