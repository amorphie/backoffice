// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';

import '../../helpers/exporter.dart';
import '_display_controller.dart';

class DisplayController extends GetxController with DisplayControllerMixin {
  DisplayController([String? _tag]) {
    setTag(_tag);
  }

  setData(Map<String, dynamic> data) async {
    EntityController entityController = Get.find<EntityController>();
    setEntity(entityController.entity);

    setDisplayLayout(entity.display ?? DisplayLayoutModel());
    setDisplayData(data);
    if (entity.display != null) {
      await getTemplates();
      await getHistories();
    }
  }

  Future _getById() async {
    EntityController entityController = Get.find<EntityController>();
    ResponseModel response = await Services().getById(entity.search.url, displayData["id"]);
    entityController.getDataList();
    setDisplayData(response.data);
  }

  Future detailTemplateRefresh() async {
    if (displayLayout.detailTemplate != null && templates[displayLayout.detailTemplate!.print()] != null) {
      await _getById();

      if (displayLayout.detailTemplate != null) addTemplates({displayLayout.detailTemplate!.print(): await getTemplate("${displayLayout.detailTemplate!.print()}", displayData)});
      if (displayLayout.summaryTemplate != null) addTemplates({displayLayout.summaryTemplate!.print(): await getTemplate("${displayLayout.summaryTemplate!.print()}", displayData)});
    }
  }

  getTemplates() async {
    clearTemplates();
    if (displayLayout.summaryTemplate != null)
      addTemplates({
        displayLayout.summaryTemplate!.print(): await getTemplate(
          "${displayLayout.summaryTemplate!.print()}",
          displayData,
        ),
      });
    if (displayLayout.detailTemplate != null)
      addTemplates({
        displayLayout.detailTemplate!.print(): await getTemplate(
          "${displayLayout.detailTemplate!.print()}",
          displayData,
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
        addTemplates({
          tab.template!.print(): await getTemplate(
            "${tab.template!.print()}",
            displayData,
          )
        });
        break;
      case DisplayTabType.search:
        addSearchModels({tab.entity!: await getSearchData(tab)});

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
    addSearchModels({tab.entity!: searchModel});
  }

  Future<DisplayTabSearchModel> getSearchData(
    DisplayTabModel tab, {
    String? keyword,
    int? pageSize,
    int? pageNumber,
  }) async {
    await Future.delayed(Duration(milliseconds: 200));

    EntityController entityController = Get.find<EntityController>();
    EntityModel entity = entityController.getEntity(tab.entity)!;
    var response = await Services().search(
      url: tab.url!.replaceAll("@id", displayData[tab.id]),
      pageSize: pageSize ?? entity.search.defaultPageSize,
      pageNumber: pageNumber ?? entity.search.defaultPageNumber,
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
    ResponseModel response = await Services().getHistory(entity: entity.workflow.entity, recordId: tag ?? displayData[entity.workflow.recordIdData] ?? "");
    historyWorkflowsClear();
    if (response.success) {
      var data = response.data["data"];
      var runningWorkflows = data["runningWorkflows"];

      for (var element in runningWorkflows) {
        HistoryWorkflowModel historyWorkflowModel = HistoryWorkflowModel.fromMap(element);
        historyWorkflowsAddItem(historyWorkflowModel);
      }
    }
  }
}
