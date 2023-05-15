//import 'dart:ffi';

import 'package:admin/data/services/services.dart';
import 'package:admin/ui/controllers/menu_controller.dart';
import 'package:get/get.dart';

import '../../data/models/entity/entity_model.dart';

class EntityController extends GetxController {
  Rx<EntityModel> _entity = EntityModel().obs;
  EntityModel get entity => _entity.value;
  set entity(EntityModel _) {
    _entity.value = _;
  }

  Map<String, EntityModel> entities = {};
  Map<String, dynamic> mocks = {};
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

    await Future.delayed(Duration(seconds: 2));
    dataList.clear();

    var response = await services.search(
      url: entity.search!.listUrl,
      pageSize: pageSize ?? entity.search!.defaultPageSize,
      pageNumber: pageNumber ?? entity.search!.defaultPageNumber,
      searchText: searchText,
    );
    var list = response.data;
    if (response.data["data"] != null) {
      list = response.data["data"];
    }
    if (list is! List) {
      list = [];
    }
    for (var item in list) {
      dataList.add(item);
    }
    loading.value = false;
  }
}
