import 'dart:developer';

import 'package:admin/data/models/display/display_view_model.dart';
import 'package:admin/ui/pages/detail_page.dart';
import 'package:admin/ui/controllers/filter_controller.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import 'display_controller.dart';
import 'entity_controller.dart';
import 'workflow_controller.dart';

class HomeController extends GetxController {
  @override
  onInit() {
    super.onInit();
    ever(selectedEntity, (callback) {
      log(DateTime.now().toIso8601String(), name: "ChangedEntity");
    });
  }

  //! DISPLAY BEGIN
  RxList<DisplayViewModel> entityList = <DisplayViewModel>[].obs;

  Rx<DisplayViewModel> selectedEntity = DisplayViewModel.init().obs;

  selectEntity(DisplayViewModel model) {
    selectedEntity.value = model;
    log(DateTime.now().toIso8601String(), name: "SelectEntity");
  }

  deselectEntity() {
    selectedEntity.value = DisplayViewModel.init();
  }

  bool get hasEntity => !selectedEntity.value.isBlank;

  Future addData(Map<String, dynamic> data) async {
    DisplayController displayController = Get.put<DisplayController>(DisplayController(data["id"]), tag: data["id"]);
    WorkflowController workflowController = Get.put<WorkflowController>(WorkflowController(data["id"]), tag: data["id"]);
    final EntityController entityController = Get.find<EntityController>();

    await workflowController.startTransition(entity: entityController.entity.workflow, recordId: data["id"]);

    await displayController.setData(data);
    DisplayViewModel model = DisplayViewModel(id: Uuid().v4(), entity: entityController.entity.name, data: data, page: DetailWidget());
    selectEntity(model);
    entityList.add(model);
  }

  Future subtractData(DisplayViewModel model) async {
    entityList.remove(model);
  }
  //!DISPLAY END

  //! FILTER BEGIN
  RxBool _filterView = false.obs;
  bool get filterView => _filterView.value;
  Future getFilterArea() async {
    FilterController filterController = Get.put<FilterController>(FilterController());
    await filterController.getFilterData();
    _filterView.value = true;
  }

  filterClose() {
    final FilterController filterController = Get.find<FilterController>();
    //filterController.dispose();
    filterController.onClose();
    _filterView.value = false;
    //filterController.filterDataList.isNotEmpty ? filterController.filterDataList.clear() : null;

    //! FILTER END
  }
}
