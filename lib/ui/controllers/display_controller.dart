// ignore_for_file: invalid_use_of_protected_member

import 'package:admin/data/models/entity/layouts/display_layout_model.dart';
import 'package:admin/data/services/executer_service.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class DisplayController extends GetxController {
  Rx<DisplayLayoutModel> _displayLayout = DisplayLayoutModel().obs;
  DisplayLayoutModel get displayLayout => _displayLayout.value;

  RxMap<String, dynamic> _displayView = <String, dynamic>{}.obs;

  Map<String, dynamic> templates = {};

  setData(Map<String, dynamic> data) async {
    EntityController entityController = Get.find<EntityController>();
    _displayLayout.value = entityController.entity.display!;

    _displayView.value = data;
    await getTemplates();
  }

  int get tabCount {
    return displayLayout.tabs!.length + (displayLayout.detail_template != null ? 1 : 0);
  }

  getTemplates() async {
    templates = {};
    if (displayLayout.summary_template != null)
      templates.addAll({
        displayLayout.summary_template!.trTR: await getTemplate(
          "${displayLayout.summary_template!.trTR}",
          _displayView.value,
        ),
      });
    if (displayLayout.detail_template != null)
      templates.addAll({
        displayLayout.detail_template!.trTR: await getTemplate(
          "${displayLayout.detail_template!.trTR}",
          _displayView.value,
        ),
      });

    for (var tab in displayLayout.tabs!) {
      if (tab.type == "render") {
        templates.addAll({
          tab.template!.trTR: await getTemplate(
            "${tab.template!.trTR}",
            {
              "consents": List.generate(20, (index) => {"name": "Deneme$index", "description": "text$index"})
            },
          )
        });
      }
    }
  }

  Future<String?> getTemplate(String name, Map<String, dynamic> renderData) async {
    var data = {
      "name": name,
      "render-id": Uuid().v4(),
      "render-data": renderData,
      "render-data-for-log": renderData,
    };
    var response = await Executer.post(
      endpoint: "https://test-template-engine.burgan.com.tr/Template/Render",
      data: data,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

    if (response.success) {
      return response.data;
    }
    return null;
  }

  reset() {
    _displayView.value = <String, dynamic>{};
  }
}
