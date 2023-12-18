//import 'dart:ffi';

import 'package:admin/data/models/entity/layout_helpers/sort/sort_column_model.dart';
import 'package:admin/data/models/entity/layout_helpers/sort/sort_direction_enum.dart';
import 'package:admin/ui/helpers/exporter.dart';

mixin EntityControllerMixin {
  Rx<EntityModel> _entity = EntityModel.init().obs;
  EntityModel get entity => _entity.value;
  setEntity(EntityModel _) => _entity.value = _;

  Rx<String> _keyword = "".obs;
  String get keyword => _keyword.value;
  setKeyword(String _) => _keyword.value = _;
  Rx<String> _endpointSuffix = "".obs;
  String get endpointSuffix => _endpointSuffix.value;
  setEndpointSuffix(String _) => _endpointSuffix.value = _;

  Rx<SortColumnModel> _sortColumn = SortColumnModel(sortColumn: "", sortDirection: SortDirection.asc).obs;
  SortColumnModel get sortColumn => _sortColumn.value;
  setSortColumn(SortColumnModel _) => _sortColumn.value = _;
  resetSortColumn() => _sortColumn.value = SortColumnModel(sortColumn: "", sortDirection: SortDirection.asc);

  int? get sortColumnIndex {
    int index = entity.search.columns.indexWhere((element) => element.data == sortColumn.sortColumn);
    if (index == -1) return null;
    return index;
  }

  setSort(String col) {
    resetPageNumber();
    if (sortColumn.sortColumn == col) {
      sortColumn.sortDirection = sortColumn.sortDirection == SortDirection.asc ? SortDirection.desc : SortDirection.asc;
    } else {
      sortColumn.sortColumn = col;
      sortColumn.sortDirection = SortDirection.asc;
    }
  }

  Rx<int> _pageNumber = 0.obs;
  int get pageNumber => _pageNumber.value;
  pageNumberIncrement() {
    _pageNumber.value = pageNumber + 1;
  }

  resetPageNumber() {
    _pageNumber.value = 0;
  }

  Map<String, EntityModel> _entities = {};

  setEntities(Map<String, EntityModel> _) {
    _entities = _;
  }

  EntityModel? getEntity(String? name) {
    if (_entities[name] != null) return _entities[name]!;
    // throw Exception("$name isimli entity bulunamadı");
    return null;
  }

  RxList<Map<String, dynamic>> _dataList = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get dataList => List<Map<String, dynamic>>.of(_dataList);
  dataListAddItem(Map<String, dynamic> item) {
    _dataList.add(item);
    _dataList.refresh();
  }

  dataListClear() {
    _dataList.clear();
    _dataList.refresh();
  }

  //! loading BEGIN
  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  start() {
    _loading.value = true;
  }

  end() {
    _loading.value = false;
  }
  //! loading END

  Services services = Services();
}
