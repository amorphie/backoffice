//import 'dart:ffi';

import 'package:admin/data/services/services.dart';
import 'package:admin/ui/controllers/menu_controller.dart';
import 'package:get/get.dart';

import '../../data/models/entity/entity_model.dart';

class EntityController extends GetxController {
  Rx<EntityModel> _entity = EntityModel.init().obs;
  EntityModel get entity => _entity.value;
  set entity(EntityModel _) {
    _entity.value = _;
  }

  Map<String, EntityModel> entities = {};
  RxBool loading = false.obs;

  RxList<Map<String, dynamic>> dataList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> userList = <Map<String, dynamic>>[].obs;
  Services services = Services();

  Future<void> init() async {
    entities = await services.getEntityData();
  }

  Future<void> setEntityMenu() async {
    AppMenuController menu = Get.find<AppMenuController>();
    EntityModel? entityModel = entities[menu.menuItem.value.entity];
    if (entityModel != null) {
      entity = entityModel;
      await getDataList();
    } else {
      Get.snackbar("Uyarı", "İsteğe uygun bir model bulunamadı");
    }
  }

  Future<void> getDataList({String? searchText, int? pageSize, int? pageNumber}) async {
    loading.value = true;

    dataList.clear();
    var list = await getData(searchText: searchText, pageSize: pageSize, pageNumber: pageNumber);
    for (var item in list) {
      dataList.add(item);
    }
    loading.value = false;
  }

  Future<List> getData({EntityModel? entityModel, String? searchText, int? pageSize, int? pageNumber}) async {
    await Future.delayed(Duration(milliseconds: 200));

    var response = await services.search(
      url: (entityModel ?? entity).search!.listUrl,
      pageSize: pageSize ?? (entityModel ?? entity).search!.defaultPageSize,
      pageNumber: pageNumber ?? (entityModel ?? entity).search!.defaultPageNumber,
      searchText: searchText,
    );
    List list = [];
    if (response.data is List) {
      list = response.data;
    } else if (response.data is Map<String, dynamic>) {
      if (response.data["data"] != null && response.data["data"] is List) {
        list = response.data["data"];
      }
    }

    return list;
  }
}
