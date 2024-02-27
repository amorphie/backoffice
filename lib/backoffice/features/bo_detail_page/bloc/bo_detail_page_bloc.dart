import 'package:backoffice/backoffice/features/bo_detail_page/network/neo_detail_network_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_path/json_path.dart';
import 'package:neo_core/neo_core.dart';

import '../../bo_search_page/bloc/neo_search_page_bloc.dart';
import 'bo_detail_page_event.dart';
import 'bo_detail_page_state.dart';

class BoDetailPageBloc extends Bloc<BoDetailPageEvent, BoDetailPageState> {
  final NeoDetailNetworkManager networkManager;
  final Map<String, dynamic> data;

  String dataWidthPath(String path) {
    var list = JsonPath(path).read(data);

    if (list.isNotEmpty) {
      return _print(list.first.value);
    } else {
      return "";
    }
  }

  List<Map<String, dynamic>> listDataWithPath(String path) {
    var list = JsonPath(path).read(data);
    var listData = <Map<String, dynamic>>[];
    if (list.isNotEmpty) {
      for (var item in list) {
        listData.add(item.value as Map<String, dynamic>);
      }
      return listData;
    } else {
      return listData;
    }
  }

  String _print(dynamic item) {
    if (item is List)
      return item.join(", ");
    else
      return item.toString();
  }

  BoDetailPageBloc({required this.networkManager, required this.data}) : super(const BoDetailPageStateViewLoading()) {
    on<BoDetailPageEventSetItem>((event, emit) async {
      try {
        final response = await networkManager.getStateView(data["state"]["name"]);
        if (response.isSuccess) {
          final responseData = (response as NeoSuccessResponse).data;
          final dataResponse = await networkManager.getWorkflowInstanceData(data["recordId"], responseData["data"]);
          if (dataResponse.isSuccess) {
            data["data"] = (dataResponse as NeoSuccessResponse).data;
          }
          // emit(const BoDetailPageStateViewError());
          emit(BoDetailPageStateViewLoaded(item: responseData));
        } else {
          emit(const BoDetailPageStateViewError());
        }
      } catch (e) {
        emit(const BoDetailPageStateViewError());
      }
    });
  }
}
