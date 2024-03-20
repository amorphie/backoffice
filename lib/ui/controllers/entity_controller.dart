//import 'dart:ffi';

import 'package:admin/data/models/entity/layout_helpers/sort/sort_column_model.dart';
import 'package:admin/data/models/entity/layout_helpers/sort/sort_direction_enum.dart';
import 'package:admin/ui/helpers/exporter.dart';

class EntityController extends GetxController {
  Rx<EntityModel> _entity = EntityModel.init().obs;
  EntityModel get entity => _entity.value;
  set entity(EntityModel _) {
    _entity.value = _;
  }

  String _keyword = "";
  String _endpointSuffix = "";

  Rx<SortColumnModel> _sortColumn = SortColumnModel(sortColumn: "", sortDirection: SortDirection.asc).obs;
  SortColumnModel get sortColumn => _sortColumn.value;
  set sortColumn(SortColumnModel _) {
    _sortColumn.value = _;
  }

  int? get sortColumnIndex {
    int index = entity.search.columns.indexWhere((element) => element.data == sortColumn.sortColumn);
    if (index == -1) return null;
    return index;
  }

  onSort(String col) {
    pageNumber = 0;
    if (sortColumn.sortColumn == col) {
      sortColumn.sortDirection = sortColumn.sortDirection == SortDirection.asc ? SortDirection.desc : SortDirection.asc;
    } else {
      sortColumn.sortColumn = col;
      sortColumn.sortDirection = SortDirection.asc;
    }

    getDataList(queries: sortColumn.toQueryMap());
  }

  int pageNumber = 0;
  resetPageNumber() {
    pageNumber = 0;
  }

  onPageChange(int p) {
    pageNumber = p;
    getDataList(isSearch: entity.search.search);
  }

  onSearch(String filter) {
    _keyword = filter;
    if (_keyword == "" || _keyword.length > 3) {
      getDataList(isSearch: true);
    }
  }

  onEndpointSuffixSend(String sf) {
    if (sf == "")
      _endpointSuffix = "";
    else
      _endpointSuffix = "/" + sf;
    if (_endpointSuffix == "" || _endpointSuffix.length > 3) {
      getDataList(isSearch: false);
    }
  }

  Map<String, EntityModel> entities = {};
  RxBool loading = false.obs;

  RxList<Map<String, dynamic>> dataList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> userList = <Map<String, dynamic>>[].obs;
  Services services = Services();

  Future<void> init() async {
    entities = await services.getEntityData();
  }

  Future refreshList() async {
    await getDataList();
  }

  Future<void> setEntityMenu() async {
    AppUiController menu = Get.find<AppUiController>();
    EntityModel? entityModel = entities[menu.menuItem.value.entity];
    _endpointSuffix = "";
    if (entityModel != null) {
      entity = entityModel;
      await getDataList();
    } else {
      Get.snackbar("Uyarı", "İsteğe uygun bir model bulunamadı");
    }
  }

  Future<void> getDataList({
    Map<String, String>? queries,
    bool isSearch = false,
  }) async {
    loading.value = true;
    if (pageNumber == 0) {
      dataList.clear();
    }
    List list = await getAllData(
      pageNumber: pageNumber,
      keyword: _keyword == "" || _keyword.length > 3 ? _keyword : null,
      queries: queries,
      isSearch: isSearch,
    );

    for (var item in list) {
      dataList.add(item);
    }
    loading.value = false;
    dataList.refresh();
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
    AppUiController menuController = Get.find<AppUiController>();
    if (menuController.menuItem.value.type == MenuItemType.query) {
      if (_queries == null) _queries = <String, String>{};
      menuController.menuItem.value.query!.forEach((key, value) {
        _queries![key] = value.toString();
      });
    }
    var response = await services.search(
        url: (entityModel ?? entity).search.url + _endpointSuffix + (isSearch ? "/search" : ""),
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
