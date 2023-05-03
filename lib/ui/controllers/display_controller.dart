import 'dart:convert';

import 'package:admin/data/services/executer_service.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class DisplayController extends GetxController {
  RxMap<String, dynamic> _displayView = <String, dynamic>{}.obs;
  Map<String, dynamic> templates = {};

  RxBool _hasDisplayView = false.obs;

  setData(Map<String, dynamic> data) async {
    _hasDisplayView.value = false;

    _displayView.value = data;
    await getTemplates();
    _hasDisplayView.value = true;
  }

  getTemplates() async {
    templates = {};
    EntityController entityController = Get.find<EntityController>();

    templates.addAll({
      entityController.entity.display!.summary_template!.trTR: await getTemplate(
        "${entityController.entity.display!.summary_template!.trTR}",
        _displayView.value,
      ),
    });

    for (var tab in entityController.entity.display!.tabs!) {
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

  bool get hasDisplayView {
    return _hasDisplayView.value;
  }

  reset() {
    _displayView.value = <String, dynamic>{};
    _hasDisplayView.value = false;
  }
}
