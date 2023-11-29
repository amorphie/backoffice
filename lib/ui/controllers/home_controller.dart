import 'dart:developer';

import '../../helpers/exporter.dart';

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

  RxBool _addDataLoading = false.obs;
  bool get addDataLoading => _addDataLoading.value;

  Future addData(Map<String, dynamic> data) async {
    _addDataLoading.value = true;
    try {
      if (data["id"] == null) {
        data["id"] = Uuid().v4();
      }
      DisplayController displayController = Get.put<DisplayController>(DisplayController(data["id"]), tag: data["id"]);
      WorkflowController workflowController = Get.put<WorkflowController>(WorkflowController(data["id"]), tag: data["id"]);
      final EntityController entityController = Get.find<EntityController>();

      await workflowController.startTransition(entity: entityController.entity.workflow, recordId: data["id"]);
      DisplayViewModel model;
      await displayController.setData(data);
      if (entityController.entity.display != null) {
        model = DisplayViewModel(
            id: Uuid().v4(),
            entity: entityController.entity.name,
            data: data,
            page: DetailWidget(
              entity: entityController.entity.name,
              id: data["id"],
            ));
      } else {
        model = DisplayViewModel(
          id: Uuid().v4(),
          entity: entityController.entity.name,
          data: data,
          page: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GenericDetailWidget(data: data, entity: entityController.entity),
          ),
        );
      }
      selectEntity(model);
      entityList.add(model);
    } catch (e) {
      print(e);
      ;
    }
    _addDataLoading.value = false;
  }

  Future subtractData(DisplayViewModel model) async {
    int index = entityList.indexWhere((element) => element == model);
    if (hasEntity) {
      if (index > -1 && entityList.length > 1) {
        if (model == selectedEntity.value) selectEntity(entityList[index - 1]);
      } else {
        deselectEntity();
      }
    }
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

  filterClose() async {
    final FilterController filterController = Get.find<FilterController>();
    //filterController.dispose();
    filterController.onClose();
    _filterView.value = false;
    //filterController.filterDataList.isNotEmpty ? filterController.filterDataList.clear() : null;
  }

  //! FILTER END

  //! DATATABLE BEGIN
  RxInt _rowPerPage = 10.obs;
  int get rowPerPage => _rowPerPage.value;
  set rowPerPage(int value) => _rowPerPage.value = value;
  setRowPerPage(int value) => _rowPerPage.value = value;
  rowPerPageReset() => _rowPerPage.value = 10;
  //! DATATABLE END
}
