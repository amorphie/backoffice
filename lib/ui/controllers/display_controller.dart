// ignore_for_file: invalid_use_of_protected_member

import 'package:admin/data/models/entity/entity_model.dart';
import 'package:admin/data/models/entity/layouts/display_layout_model.dart';
import 'package:admin/data/models/history/history_workflow_model.dart';
import 'package:admin/data/services/common/response_model.dart';
import 'package:admin/data/services/services.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../data/models/display/display_tab_search_model.dart';

class DisplayController extends GetxController {
  DisplayController([this._tag]);
  // ignore: unused_field
  String? _tag;

  Rx<DisplayLayoutModel> _displayLayout = DisplayLayoutModel().obs;
  DisplayLayoutModel get displayLayout => _displayLayout.value;

  RxMap<String, dynamic> _displayView = <String, dynamic>{}.obs;

  Map<String, dynamic> templates = {};
  RxMap<String, DisplayTabSearchModel> searchModels =
      <String, DisplayTabSearchModel>{}.obs;

  RxList<HistoryWorkflowModel> historyWorkflows = <HistoryWorkflowModel>[].obs;

  setData(Map<String, dynamic> data) async {
    EntityController entityController = Get.find<EntityController>();
    _displayLayout.value = entityController.entity.display!;

    _displayView.value = data;
    await getTemplates();
    await getHistories();
  }

  int get tabCount {
    EntityController entityController = Get.find<EntityController>();

    return displayLayout.tabs!.length +
        (displayLayout.detailTemplate != null ? 1 : 0) +
        (entityController.entity.display!.history! ? 1 : 0);
  }

  Future _getById() async {
    EntityController entityController = Get.find<EntityController>();
    ResponseModel response = await Services()
        .getById(entityController.entity.url, _displayView.value["id"]);
    _displayView.value = response.data;
  }

  Future detailTemplateRefresh() async {
    if (displayLayout.detailTemplate != null &&
        templates[displayLayout.detailTemplate!.enEN] != null) {
      await _getById();
      templates[displayLayout.detailTemplate!.enEN] = await getTemplate(
          "${displayLayout.detailTemplate!.enEN}", _displayView.value);
    }
  }

  getTemplates() async {
    templates = {};
    if (displayLayout.summaryTemplate != null)
      templates.addAll({
        displayLayout.summaryTemplate!.enEN: await getTemplate(
          "${displayLayout.summaryTemplate!.enEN}",
          _displayView.value,
        ),
      });
    if (displayLayout.detailTemplate != null)
      templates.addAll({
        displayLayout.detailTemplate!.enEN: await getTemplate(
          "${displayLayout.detailTemplate!.enEN}",
          _displayView.value,
        ),
      });

    for (var tab in displayLayout.tabs!) {
      if (tab.type == "render") {
        templates.addAll({
          tab.template!.enEN: await getTemplate(
            "${tab.template!.enEN}",
            {
              "consents": List.generate(
                  20,
                  (index) =>
                      {"name": "Deneme$index", "description": "text$index"})
            },
          )
        });
      } else if (tab.type == "search") {
        searchModels.addAll({tab.entity: await getSearchData(tab.entity)});
      }
    }
  }

  Future search({
    required String entity,
    required String keyword,
    int? pageSize,
    int? pageNumber,
  }) async {
    DisplayTabSearchModel searchModel =
        await getSearchData(entity, keyword: keyword);
    searchModels[entity] = searchModel;
    searchModels.refresh();
  }

  Future<DisplayTabSearchModel> getSearchData(
    String entityName, {
    String? keyword,
    int? pageSize,
    int? pageNumber,
  }) async {
    EntityController entityController = Get.find<EntityController>();
    EntityModel entity = entityController.entities[entityName]!;
    var list = await entityController.getAllData(
      entityModel: entity,
      keyword: keyword,
      pageSize: pageSize,
      pageNumber: pageNumber,
    ); //TODO tag a search eklenince burası search diye değişecek
    return DisplayTabSearchModel(
      tag: entityName,
      data: list,
      entity: entity,
    );
  }

  Future<String?> getTemplate(
      String name, Map<String, dynamic> renderData) async {
    var data = {
      "name": name,
      "render-id": Uuid().v4(),
      "render-data": renderData,
      "render-data-for-log": renderData,
    };
    var response = await Services().getTemplate(data: data);

    if (response.success) {
      return response.data;
    }
    return null;
  }

  Future getHistories() async {
    EntityController entityController = Get.find<EntityController>();

    ResponseModel response = await Services().getHistory(
        entity: entityController.entity.workflow,
        recordId: _displayView.value["id"]);
    historyWorkflows.clear();
    if (response.success) {
      var data = response.data["data"];
      var runningWorkflows = data["runningWorkflows"];

      for (var element in runningWorkflows) {
        HistoryWorkflowModel historyWorkflowModel =
            HistoryWorkflowModel.fromMap(element);
        historyWorkflows.add(historyWorkflowModel);
      }
    }
  }

  reset() {
    _displayView.value = <String, dynamic>{};
  }
}
