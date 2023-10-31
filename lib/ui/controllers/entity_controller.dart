//import 'dart:ffi';

import 'package:admin/data/services/services.dart';
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
    List list;
    if (!isSearch) {
      list = await getAllData(
        pageSize: pageSize,
        pageNumber: pageNumber,
      );
    } else {
      list = await getSearchData(
        keyword: _keyword == "" || _keyword.length > 3 ? _keyword : null,
        pageSize: pageSize,
        pageNumber: pageNumber,
        queries: queries,
      );
    }
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
  }) async {
    await Future.delayed(Duration(milliseconds: 200));

    var response = await services.search(
        url: (entityModel ?? entity).url + _endpointSuffix,
        pageSize: pageSize ?? (entityModel ?? entity).search!.defaultPageSize,
        pageNumber: pageNumber ?? (entityModel ?? entity).search!.defaultPageNumber,
        keyword: keyword,
        queries: queries);
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

  Future<List> getSearchData({
    EntityModel? entityModel,
    String? keyword,
    int? pageSize,
    int? pageNumber,
    Map<String, String>? queries,
  }) async {
    await Future.delayed(Duration(milliseconds: 200));

    var response = await services.search(
        url: (entityModel ?? entity).url + _endpointSuffix + "/search",
        pageSize: pageSize ?? (entityModel ?? entity).search!.defaultPageSize,
        pageNumber: pageNumber ?? (entityModel ?? entity).search!.defaultPageNumber,
        keyword: keyword,
        queries: queries);
    List list = [];
    if (response.data is List) {
      list = response.data;
    } else if (response.data is Map<String, dynamic>) {
      if (response.data["data"] != null && response.data["data"] is List) {
        list = response.data["data"];
      }
    } else if ((entityModel ?? entity).search!.subDataField != null) {
      //TODO Alt alta gelen modelleri listeleme yapılacak
      if (response.data[(entityModel ?? entity).search!.subDataField] != null && response.data[(entityModel ?? entity).search!.subDataField] is List) {
        list = response.data[(entityModel ?? entity).search!.subDataField];
      }
    }

    return list;
  }
}
