import '../helpers/exporter.dart';

class FilterController extends GetxController {
  Map<String, List> filterDataList = {};
  RxMap<String, String> filterQueryList = <String, String>{}.obs;

  addFilter(FilterLayout filter, dynamic data) {
    if (filterQueryList[filter.query] != null) {
      filterQueryList[filter.query] = data.toString();
    } else {
      filterQueryList.addAll({filter.query: data.toString()});
    }
    filterQueryList.refresh();
  }

  removeFilter(FilterLayout filter) {
    if (filterQueryList[filter.query] != null) {
      filterQueryList.remove(filter.query);
    }
    filterQueryList.refresh();
  }

  Future getFilterData() async {
    EntityController entityController = Get.find<EntityController>();

    for (var filter in entityController.entity.search.filter!) {
      if (filter.type == FilterType.reference) {
        var response = await Services().search(
          url: entityController.getEntity(filter.entity)!.search.url,
          pageSize: entityController.getEntity(filter.entity)!.search.defaultPageSize,
          pageNumber: entityController.getEntity(filter.entity)!.search.defaultPageNumber,
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
    entityController.getDataList(queries: filterQueryList, isSearch: entityController.entity.search.search);
  }
}
