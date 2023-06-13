import 'package:admin/data/models/entity/enums/filter_type.dart';
import 'package:admin/data/models/entity/layout_helpers/filter_layout_model.dart';
import 'package:admin/data/services/services.dart';
import 'package:get/get.dart';

import 'entity_controller.dart';

class FilterController extends GetxController {
  Map<String, List> filterDataList = {};
  RxMap<String, String> filterQueryList = <String, String>{}.obs;

  addFilter(FilterLayout filter, dynamic data) {
    if (filterQueryList[filter.entity] != null) {
      filterQueryList[filter.entity] = data.toString();
    } else {
      filterQueryList.addAll({filter.entity: data.toString()});
    }
    filterQueryList.refresh();
  }

  removeFilter(FilterLayout filter) {
    if (filterQueryList[filter.entity] != null) {
      filterQueryList.remove(filter.entity);
    }
    filterQueryList.refresh();
  }

  Future getFilterData() async {
    EntityController entityController = Get.find<EntityController>();

    for (var filter in entityController.entity.search!.filter!) {
      if (filter.type == FilterType.reference) {
        var response = await Services().search(
          url: entityController.entities[filter.entity]!.search!.listUrl,
          pageSize: entityController.entities[filter.entity]!.search!.defaultPageSize,
          pageNumber: entityController.entities[filter.entity]!.search!.defaultPageNumber,
        );
        var list = response.data;
        if (list is! List) {
          list = [];
        }
        filterDataList.addAll({filter.entity: list});
      }
    }
  }

  Future onFilter() async {
    EntityController entityController = Get.find<EntityController>();
    entityController.getDataList(queries: filterQueryList, isSearch: true);
  }
}
