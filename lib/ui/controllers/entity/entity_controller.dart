import 'package:admin/ui/helpers/exporter.dart';

import '_entity_controller.dart';

class EntityController extends GetxController with EntityControllerMixin {
  onSort(String col) {
    setSort(col);

    getDataList();
  }

  onPageChange() {
    pageNumberIncrement();
    getDataList(isSearch: entity.search.search);
  }

  onSearch(String filter) {
    setKeyword(filter);
    if (keyword == "" || keyword.length > 3) {
      getDataList(isSearch: true);
    }
  }

  onEndpointSuffixSend(String sf) {
    if (sf == "")
      setEndpointSuffix("");
    else
      setEndpointSuffix("/" + sf);
    if (endpointSuffix == "" || endpointSuffix.length > 3) {
      getDataList(isSearch: false);
    }
  }

  Future<void> init() async {
    setEntities(await services.getEntityData());
  }

  Future refreshList() async {
    await getDataList();
  }

  Future<void> setEntityMenu() async {
    AppUiController menu = Get.find<AppUiController>();
    EntityModel? entityModel = getEntity(menu.menuItem.entity);

    setEndpointSuffix("");
    if (entityModel != null) {
      setEntity(entityModel);
      await getDataList();
    } else {
      Get.snackbar("Uyarı", "İsteğe uygun bir model bulunamadı");
    }
  }

  Future<void> getDataList({
    Map<String, String>? queries,
    bool isSearch = false,
  }) async {
    start();
    if (pageNumber == 0) {
      dataListClear();
    }
    List list = await getAllData(
      pageNumber: pageNumber,
      keyword: keyword == "" || keyword.length > 3 ? keyword : null,
      queries: queries,
      isSearch: isSearch,
    );

    for (var item in list) {
      dataListAddItem(item);
    }
    end();
  }

  Future<List> getAllData({
    EntityModel? entityModel,
    String? keyword,
    int? pageSize,
    int? pageNumber,
    Map<String, String>? queries,
    bool isSearch = false,
  }) async {
    Map<String, String>? _queries = queries;
    if (_queries == null) _queries = <String, String>{};
    AppUiController menuController = Get.find<AppUiController>();
    if (menuController.menuItem.type == MenuItemType.query) {
      menuController.menuItem.query!.forEach((key, value) {
        _queries![key] = value.toString();
      });
    }
    _queries.addAll(sortColumn.toQueryMap());

    var response = await services.search(
        url: (entityModel ?? entity).search.url + endpointSuffix + (isSearch ? "/search" : ""),
        pageSize: pageSize ?? (entityModel ?? entity).search.defaultPageSize,
        pageNumber: pageNumber ?? (entityModel ?? entity).search.defaultPageNumber,
        keyword: keyword,
        queries: _queries);
    List list = [];
    if (response.data is List) {
      list = response.data;
    } else if (response.data is Map<String, dynamic>) {
      if (response.data["data"] != null && response.data["data"] is List) {
        list = response.data["data"];
      } else if ((entityModel ?? entity).search.subDataField != null) {
        //TODO Alt alta gelen modelleri listeleme yapılacak
        if (response.data[(entityModel ?? entity).search.subDataField] != null && response.data[(entityModel ?? entity).search.subDataField] is List) {
          list = response.data[(entityModel ?? entity).search.subDataField];
        }
      }
    }

    return list;
  }
}
