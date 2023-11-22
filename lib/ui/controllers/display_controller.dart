// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';

import 'package:admin/data/models/entity/entity_model.dart';
import 'package:admin/data/models/entity/enums/display_tab_type.dart';
import 'package:admin/data/models/entity/layout_helpers/display_tab_model.dart';
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
  Map<String, dynamic> get displayView => _displayView.value;

  RxMap<String, dynamic> templates = <String, dynamic>{}.obs;
  RxMap<String, DisplayTabSearchModel> searchModels = <String, DisplayTabSearchModel>{}.obs;

  RxList<HistoryWorkflowModel> historyWorkflows = <HistoryWorkflowModel>[].obs;

  EntityModel _entity = EntityModel.init();

  setData(Map<String, dynamic> data) async {
    EntityController entityController = Get.find<EntityController>();
    _entity = entityController.entity;

    _displayLayout.value = _entity.display ?? DisplayLayoutModel();
    _displayView.value = data;
    if (_entity.display != null) {
      await getTemplates();
      await getHistories();
    }
  }

  int get tabCount {
    return (displayLayout.tabs?.length ?? 0) + 1 + (_entity.display!.history! ? 1 : 0);
  }

  Future _getById() async {
    EntityController entityController = Get.find<EntityController>();
    ResponseModel response = await Services().getById(_entity.url, _displayView.value["id"]);
    entityController.getDataList();
    _displayView.value = response.data;
  }

  Future detailTemplateRefresh() async {
    if (displayLayout.detailTemplate != null && templates[displayLayout.detailTemplate!.enEN] != null) {
      await _getById();
      templates[displayLayout.detailTemplate!.enEN] = await getTemplate("${displayLayout.detailTemplate!.enEN}", _displayView.value);
      templates[displayLayout.summaryTemplate!.enEN] = await getTemplate("${displayLayout.summaryTemplate!.enEN}", _displayView.value);
    }
    templates.refresh();
  }

  getTemplates() async {
    templates.clear();
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
    if (displayLayout.tabs != null) {
      for (var tab in displayLayout.tabs!) {
        await getTabTemplates(tab);
      }
    }
  }

  Future getTabTemplates([DisplayTabModel? tab]) async {
    if (tab != null) {
      if (tab.type.isSplit) {
        for (var item in tab.items!) {
          await getTabTemplates(item);
        }
      } else
        await addTabTemplate(tab);
    }
  }

  Future addTabTemplate(DisplayTabModel tab) async {
    switch (tab.type) {
      case DisplayTabType.render:
        templates.addAll({
          tab.template!.enEN: await getTemplate(
            "${tab.template!.enEN}",
            _displayView.value,
          )
        });
        break;
      case DisplayTabType.search:
        searchModels.addAll({tab.entity!: await getSearchData(tab)});

        break;
      default:
    }
  }

  Future search({
    required DisplayTabModel tab,
    required String keyword,
    int? pageSize,
    int? pageNumber,
  }) async {
    DisplayTabSearchModel searchModel = await getSearchData(tab, keyword: keyword);
    searchModels[tab.entity!] = searchModel;
    searchModels.refresh();
  }

  Future<DisplayTabSearchModel> getSearchData(
    DisplayTabModel tab, {
    String? keyword,
    int? pageSize,
    int? pageNumber,
  }) async {
    await Future.delayed(Duration(milliseconds: 200));

    EntityController entityController = Get.find<EntityController>();
    EntityModel entity = entityController.entities[tab.entity]!;
    var response = await Services().search(
      url: tab.url!.replaceAll("@id", _displayView.value[tab.id]),
      pageSize: pageSize ?? entity.search!.defaultPageSize,
      pageNumber: pageNumber ?? entity.search!.defaultPageNumber,
      keyword: keyword,
    );
    List list = [];
    if (response.data is List) {
      list = response.data;
    } else if (response.data is Map<String, dynamic>) {
      if (response.data["data"] != null && response.data["data"] is List) {
        list = response.data["data"];
      }
    }

    return DisplayTabSearchModel(
      tag: tab.entity!,
      data: list,
      entity: entity,
    );
  }

  Future<String?> getTemplate(String name, Map<String, dynamic> renderData) async {
    var data = {
      "name": name,
      "render-id": Uuid().v4(),
      "render-data": renderData,
      "render-data-for-log": renderData,
    };
    log(name, name: "templateget");

    var response = await Services().getTemplate(data: data);

    if (response.success) {
      return response.data;
    }
    return null;
  }

  Future getHistories() async {
    ResponseModel response = await Services().getHistory(entity: _entity.workflow, recordId: _displayView.value["id"] ?? "");
    historyWorkflows.clear();
    if (response.success) {
      var data = response.data["data"];
      var runningWorkflows = data["runningWorkflows"];

      for (var element in runningWorkflows) {
        HistoryWorkflowModel historyWorkflowModel = HistoryWorkflowModel.fromMap(element);
        historyWorkflows.add(historyWorkflowModel);
      }
    }
    historyWorkflows.refresh();
  }

  reset() {
    _displayView.value = <String, dynamic>{};
  }
}
