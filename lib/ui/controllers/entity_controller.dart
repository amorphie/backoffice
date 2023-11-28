//import 'dart:ffi';

import 'package:admin/data/services/services.dart';
import 'package:admin/helpers/exporter.dart';
import 'package:admin/ui/controllers/ui_controller.dart';
import 'package:get/get.dart';

import '../../data/models/entity/entity_model.dart';

class EntityController extends GetxController {
  Rx<EntityModel> _entity = EntityModel.init().obs;
  EntityModel get entity => _entity.value;
  set entity(EntityModel _) {
    _entity.value = _;
  }

  String _keyword = "";
  String _endpointSuffix = "";

  int? pageSize;
  int? pageNumber;
  setPage(int p) {
    pageNumber = p;
    getDataList(isSearch: true);
  }

  setPageSize(int ps) {
    pageSize = ps;
    getDataList(isSearch: true);
  }

  setFilter(String filter) {
    _keyword = filter;
    if (_keyword == "" || _keyword.length > 3) {
      getDataList(isSearch: true);
    }
  }

  setEndpointSuffix(String sf) {
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

    dataList.clear();
    List list = await getAllData(
      pageSize: pageSize,
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
        url: (entityModel ?? entity).url + _endpointSuffix + (isSearch ? "/search" : ""),
        pageSize: pageSize ?? (entityModel ?? entity).search!.defaultPageSize,
        pageNumber: pageNumber ?? (entityModel ?? entity).search!.defaultPageNumber,
        keyword: keyword,
        queries: _queries);
    List list = [];
    if (response.data is List) {
      list = response.data;
    } else if (response.data is Map<String, dynamic>) {
      if (response.data["data"] != null && response.data["data"] is List) {
        list = response.data["data"];
      } else if ((entityModel ?? entity).search!.subDataField != null) {
        //TODO Alt alta gelen modelleri listeleme yapılacak
        if (response.data[(entityModel ?? entity).search!.subDataField] != null && response.data[(entityModel ?? entity).search!.subDataField] is List) {
          list = response.data[(entityModel ?? entity).search!.subDataField];
        }
      }
    }

    return list;
  }

  // Future<List> getSearchData({
  //   EntityModel? entityModel,
  //   String? keyword,
  //   int? pageSize,
  //   int? pageNumber,
  //   Map<String, String>? queries,
  // }) async {
  //   var response = await services.search(
  //       url: (entityModel ?? entity).url + _endpointSuffix + "/search",
  //       pageSize: pageSize ?? (entityModel ?? entity).search!.defaultPageSize,
  //       pageNumber: pageNumber ?? (entityModel ?? entity).search!.defaultPageNumber,
  //       keyword: keyword,
  //       queries: queries);
  //   List list = [];
  //   if (response.data is List) {
  //     list = response.data;
  //   } else if (response.data is Map<String, dynamic>) {
  //     if (response.data["data"] != null && response.data["data"] is List) {
  //       list = response.data["data"];
  //     }
  //   } else if ((entityModel ?? entity).search!.subDataField != null) {
  //     //TODO Alt alta gelen modelleri listeleme yapılacak
  //     if (response.data[(entityModel ?? entity).search!.subDataField] != null && response.data[(entityModel ?? entity).search!.subDataField] is List) {
  //       list = response.data[(entityModel ?? entity).search!.subDataField];
  //     }
  //   }

  //   return list;
  // }
}
