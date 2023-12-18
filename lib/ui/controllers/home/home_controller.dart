import 'package:admin/ui/controllers/home/_home_controller.dart';

import '../../helpers/exporter.dart';

class HomeController extends GetxController with HomeControllerMixin {
  // @override
  // onInit() {
  //   super.onInit();
  //   ever(selectedEntity, (callback) {
  //     log(DateTime.now().toIso8601String(), name: "ChangedEntity");
  //   });
  // }

  Future selectDisplayData(Map<String, dynamic> data) async {
    setAddDataLoading(true);
    try {
      if (data["id"] == null) {
        data["id"] = Uuid().v4();
      }
      final EntityController entityController = Get.find<EntityController>();
      String dataId = data[entityController.entity.workflow.recordIdData] ?? Uuid().v4();
      String entityName = data[entityController.entity.workflow.entityNameData] ?? entityController.entity.workflow.entity;
      String? workflowName = data[entityController.entity.workflow.workflowNameData] ?? Uuid().v4();

      DisplayController displayController = Get.put<DisplayController>(DisplayController(dataId), tag: dataId);
      WorkflowController workflowController = Get.put<WorkflowController>(WorkflowController(dataId), tag: dataId);

      await workflowController.startTransition(entity: entityName, recordId: dataId, stateManager: workflowName);
      await displayController.setData(data);

      DisplayViewModel model = DisplayViewModel(
          id: dataId,
          entity: entityController.entity.name,
          data: data,
          page: entityController.entity.display != null
              ? DetailWidget(
                  entity: entityController.entity.name,
                  id: dataId,
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GenericDetailWidget(data: data, entity: entityController.entity),
                ));
      addData(model);
    } catch (e) {
      print(e);
      ;
    }
    setAddDataLoading(false);
  }

  Future getFilterArea() async {
    FilterController filterController = Get.put<FilterController>(FilterController());
    await filterController.getFilterData();
    setFilterView(true);
  }

  filterClose() async {
    final FilterController filterController = Get.find<FilterController>();
    //filterController.dispose();
    filterController.onClose();
    setFilterView(false);
    //filterController.filterDataList.isNotEmpty ? filterController.filterDataList.clear() : null;
  }
}
