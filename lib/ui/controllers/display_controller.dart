// ignore_for_file: invalid_use_of_protected_member

import 'package:admin/data/models/entity/entity_model.dart';
import 'package:admin/data/models/entity/layouts/display_layout_model.dart';
import 'package:admin/data/services/services.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../data/models/display/display_tab_search_model.dart';

class DisplayController extends GetxController {
  Rx<DisplayLayoutModel> _displayLayout = DisplayLayoutModel().obs;
  DisplayLayoutModel get displayLayout => _displayLayout.value;

  RxMap<String, dynamic> _displayView = <String, dynamic>{}.obs;

  Map<String, dynamic> templates = {};
  RxMap<String, DisplayTabSearchModel> searchModels = <String, DisplayTabSearchModel>{}.obs;

  setData(Map<String, dynamic> data) async {
    EntityController entityController = Get.find<EntityController>();
    _displayLayout.value = entityController.entity.display!;

    _displayView.value = data;
    await getTemplates();
  }

  int get tabCount {
    return displayLayout.tabs!.length + (displayLayout.detailTemplate != null ? 1 : 0);
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
              "consents": List.generate(20, (index) => {"name": "Deneme$index", "description": "text$index"})
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
    DisplayTabSearchModel searchModel = await getSearchData(entity, keyword: keyword, pageSize: 5); //TODO Şimdilik 5 yaptık
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
    var list = await entityController.getData(
      entityModel: entity,
      keyword: keyword,
      pageSize: pageSize,
      pageNumber: pageNumber,
    );
    return DisplayTabSearchModel(
      tag: entityName,
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
    var response = await Services().getTemplate(data: data);

    if (response.success) {
      return response.data;
    }
    return null;
  }

  reset() {
    _displayView.value = <String, dynamic>{};
  }
}
