import 'package:admin/data/models/display/display_view_model.dart';
import 'package:admin/ui/components/detail_widget.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import 'display_controller.dart';
import 'entity_controller.dart';
import 'workflow_controller.dart';

class HomeController extends GetxController {
  RxList<DisplayViewModel> entityList = <DisplayViewModel>[].obs;

  Rx<DisplayViewModel> selectedEntity = DisplayViewModel.init().obs;

  selectEntity(DisplayViewModel model) {
    selectedEntity.value = model;
  }

  deselectEntity() {
    selectedEntity.value = DisplayViewModel.init();
  }

  bool get hasEntity => !selectedEntity.value.isBlank;

  Future addData(Map<String, dynamic> data) async {
    DisplayController displayController = Get.put<DisplayController>(DisplayController(), tag: data["id"]);
    WorkflowController workflowController = Get.put<WorkflowController>(WorkflowController(), tag: data["id"]);
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
}