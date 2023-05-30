import 'package:admin/data/models/entity/enums/filter_type.dart';
import 'package:admin/data/models/entity/layout_helpers/filter_layout_model.dart';
import 'package:admin/data/services/services.dart';
import 'package:get/get.dart';

import 'entity_controller.dart';

class FilterController extends GetxController {
  Map<String, List> filterDataList = {};
  RxMap<String, String> filterQueryList = <String, String>{}.obs;

  addFilter(FilterLayout filter, dynamic data) {
    if (filterQueryList[filter.data] != null) {
      filterQueryList[filter.data] = data.toString();
    } else {
      filterQueryList.addAll({filter.data: data.toString()});
    }
    filterQueryList.refresh();
  }

  removeFilter(FilterLayout filter) {
    if (filterQueryList[filter.data] != null) {
      filterQueryList.remove(filter.data);
    }
    filterQueryList.refresh();
  }

  Future getFilterData() async {
    EntityController entityController = Get.find<EntityController>();

    for (var filter in entityController.entity.search!.filter!) {
      if (filter.type == FilterType.reference) {
        var response = await Services().search(
          url: entityController.entities[filter.data]!.search!.listUrl,
          pageSize: entityController.entities[filter.data]!.search!.defaultPageSize,
          pageNumber: entityController.entities[filter.data]!.search!.defaultPageNumber,
        );
        var list = response.data;
        if (list is! List) {
          list = [];
        }
        filterDataList.addAll({filter.data: list});
      }
    }
  }
}
